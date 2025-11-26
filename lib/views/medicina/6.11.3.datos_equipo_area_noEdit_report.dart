import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:hospital/views/medicina/btn_reportar_falla.dart';
import 'package:hospital/widgets/card_btn_equipo_widget_report_Falla.dart';
import 'package:intl/intl.dart';
import 'package:hospital/widgets/appBar_interfaces_widget.dart';
// import 'package:hospital/views/6.12.edit_datos_equipos_area.dart';

class datosEquiposAreanoEditReport extends StatelessWidget {
  final String area; // Ej: 'uci', 'emergencia', 'hospitalizacion'
  final String tipoEquipo; // Ej: 'Monitor Multiparametro'

  const datosEquiposAreanoEditReport({
    super.key,
    required this.area,
    required this.tipoEquipo,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: appbarInterfacesWidget(
          nameAppbar: 'Equipos $area',
          nameColorText: Colors.black,
        ),
        body: StreamBuilder<QuerySnapshot>(
          stream:
              FirebaseFirestore.instance
                  .collection('hospital')
                  .doc('Categorias')
                  .collection('areas_hospital')
                  .doc(area)
                  .collection('equipos')
                  .where('denominacion', isEqualTo: tipoEquipo)
                  .snapshots(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(child: CircularProgressIndicator());
            }

            if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
              return Center(
                child: Text('No hay equipos de este tipo registrados.'),
              );
            }

            return ListView(
              children:
                  snapshot.data!.docs.map((doc) {
                    final data = doc.data() as Map<String, dynamic>;

                    // ✅ Formatear la fecha del campo 'creado'
                    String fechaIngresoFormateada = '';
                    if (data['creado'] != null && data['creado'] is Timestamp) {
                      final DateTime fechaIngreso =
                          (data['creado'] as Timestamp).toDate();
                      fechaIngresoFormateada = DateFormat.yMMMMd(
                        'es',
                      ).add_jm().format(fechaIngreso);
                    }

                    return CardEquipoWidgetnoEditReport(
                      codigo: data['id_equipo'] ?? '',
                      nombre: data['denominacion'] ?? '',
                      anios: data['vida_util']?.toString() ?? '',
                      marca: data['marca'] ?? '',
                      modelo: data['modelo'] ?? '',
                      codigoInterno: data['codigoInterno'] ?? '',
                      codigoPatrimonial: data['codigoPatrimonial'] ?? '',
                      fechaIngreso:
                          fechaIngresoFormateada, // Si tienes este dato, colócalo
                      ubicacion: data['area'] ?? area,
                      estado: 'Operativo', // Si tienes un campo real, úsalo
                      reportFalla: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => reportFalla(data: data),
                          ),
                        );
                      },
                    );
                  }).toList(),
            );
          },
        ),
      ),
    );
  }
}
