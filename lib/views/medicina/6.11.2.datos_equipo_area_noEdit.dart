// Vista - datos_equipos_area_no_edit.dart (usando MVVM)
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:hospital/widgets/appBar_interfaces_widget.dart';
import 'package:hospital/widgets/card_equipo_widget_noEdit.dart';
import 'package:hospital/viewmodels/datos_equipo_viewmodel.dart';

class DatosEquiposAreaNoEdit extends StatelessWidget {
  final String area; // Ej: 'uci', 'emergencia', 'hospitalizacion'
  final String tipoEquipo; // Ej: 'Monitor Multiparametro'

  const DatosEquiposAreaNoEdit({
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
              return const Center(child: CircularProgressIndicator());
            }

            if (viewModel.equipos.isEmpty) {
              return const Center(
                child: Text('No hay equipos de este tipo registrados.'),
              );
            }

            return ListView.builder(
              itemCount: viewModel.equipos.length,
              itemBuilder: (context, index) {
                final equipo = viewModel.equipos[index];
                return CardEquipoWidgetnoEdit(
                  codigo: equipo.idEquipo,
                  nombre: equipo.denominacion,
                  anios: equipo.vidaUtil?.toString() ?? '',
                  marca: equipo.marca ?? '',
                  modelo: equipo.modelo ?? '',
                  codigoInterno: equipo.codigoInterno ?? '',
                  codigoPatrimonial: equipo.codigoPatrimonial ?? '',
                  fechaIngreso: equipo.fechaIngresoFormateada,
                  ubicacion: equipo.area,
                  estado: 'Operativo', // Puedes cambiar si tienes estado real
                );
              },
            );
          },
        ),
      ),
    );
  }
}
