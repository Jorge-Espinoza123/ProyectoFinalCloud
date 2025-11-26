import 'package:flutter/material.dart';
import 'package:hospital/views/mantenimiento/btn_historial_mantenimiento.dart';
import 'package:provider/provider.dart';
import 'package:hospital/widgets/appBar_interfaces_widget.dart';
import 'package:hospital/widgets/card_equipo_widget.dart';
import 'package:hospital/views/patrimonio/btn_edit_datos_equipos_area.dart';
import 'package:hospital/viewmodels/datos_equipo_viewmodel.dart';

class datosEquiposArea extends StatelessWidget {
  final String area;
  final String tipoEquipo;

  const datosEquiposArea({
    super.key,
    required this.area,
    required this.tipoEquipo,
  });

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => DatosEquipoViewModel(area, tipoEquipo)..fetchEquipos(),
      child: Scaffold(
        appBar: appbarInterfacesWidget(
          nameAppbar: 'Equipos $area',
          nameColorText: Colors.black,
        ),
        body: Consumer<DatosEquipoViewModel>(
          builder: (context, viewModel, _) {
            if (viewModel.isLoading) {
              return Center(child: CircularProgressIndicator());
            }

            if (viewModel.equipos.isEmpty) {
              return Center(
                child: Text('No hay equipos de este tipo registrados.'),
              );
            }

            return ListView.builder(
              itemCount: viewModel.equipos.length,
              itemBuilder: (context, index) {
                final equipo = viewModel.equipos[index];
                return CardEquipoWidget(
                  codigo: equipo.idEquipo,
                  nombre: equipo.denominacion,
                  anios: equipo.vidaUtil?.toString() ?? '',
                  marca: equipo.marca ?? '',
                  modelo: equipo.modelo ?? '',
                  codigoInterno: equipo.codigoInterno ?? '',
                  codigoPatrimonial: equipo.codigoPatrimonial ?? '',
                  fechaIngreso: equipo.fechaIngresoFormateada,
                  ubicacion: equipo.area,
                  estado: 'Operativo',
                  editIcon: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder:
                            (_) => editDatosEquipArea(
                              docRef: equipo.reference!,
                              data: {
                                'marca': equipo.marca,
                                'modelo': equipo.modelo,
                                'codigoInterno': equipo.codigoInterno,
                                'codigoPatrimonial': equipo.codigoPatrimonial,
                              },
                            ),
                      ),
                    );
                  },
                  deleteIcon: () async {
                    final confirm = await showDialog<bool>(
                      context: context,
                      builder:
                          (_) => AlertDialog(
                            title: Text('Eliminar equipo'),
                            content: Text('¿Deseas eliminar este equipo?'),
                            actions: [
                              TextButton(
                                onPressed: () => Navigator.pop(context, false),
                                child: Text('Cancelar'),
                              ),
                              TextButton(
                                onPressed: () => Navigator.pop(context, true),
                                child: Text('Eliminar'),
                              ),
                            ],
                          ),
                    );

                    if (confirm == true) {
                      await equipo.reference!.delete();
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('Equipo eliminado')),
                      );
                      viewModel.fetchEquipos();
                    }
                  },
                  historialMantenimiento: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder:
                            (context) => HistorialMantenimientoPage(
                              area: area,
                              idEquipo: equipo.idEquipo,
                            ),
                      ),
                    );
                  },
                );
              },
            );
          },
        ),
      ),
    );
  }
}
