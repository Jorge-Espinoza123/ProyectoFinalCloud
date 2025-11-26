import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:hospital/widgets/appBar_interfaces_widget.dart';
import 'package:intl/intl.dart';

class HistorialMantenimientoPage extends StatelessWidget {
  final String area;
  final String idEquipo;

  const HistorialMantenimientoPage({
    super.key,
    required this.area,
    required this.idEquipo,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appbarInterfacesWidget(
        nameAppbar: 'Historial de Mantenimiento',
        nameColorText: Colors.black,
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream:
            FirebaseFirestore.instance
                .collection('hospital')
                .doc('Categorias')
                .collection('areas_hospital')
                .doc(area)
                .collection('mantenimiento')
                .where('equipo_id', isEqualTo: idEquipo)
                // .orderBy('fecha', descending: true)
                .snapshots(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          }

          if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
            return Center(child: Text('No hay mantenimientos registrados.'));
          }

          return ListView.builder(
            itemCount: snapshot.data!.docs.length,
            itemBuilder: (context, index) {
              final data =
                  snapshot.data!.docs[index].data() as Map<String, dynamic>;

              return Card(
                margin: EdgeInsets.all(10),
                child: ListTile(
                  title: Text('${data['tipo']} - ${data['fecha']}'),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Problema: ${data['problema']}'),
                      Text('Diagnóstico: ${data['diagnostico']}'),
                      Text('Trabajo: ${data['trabajo']}'),
                      Text('Prioridad: ${data['prioridad']}'),
                    ],
                  ),
                  isThreeLine: true,
                ),
              );
            },
          );
        },
      ),
    );
  }
}
