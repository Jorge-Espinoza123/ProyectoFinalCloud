import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:hospital/widgets/appBar_interfaces_widget.dart';
import 'package:intl/intl.dart';

class FallasReportadasView extends StatelessWidget {
  const FallasReportadasView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appbarInterfacesWidget(
        nameAppbar: 'Fallas Reportadas',
        nameColorText: Colors.black,
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream:
            FirebaseFirestore.instance
                .collectionGroup('fallas_list')
                .snapshots(), // 🔥 Consulta fallas de cualquier área
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          }

          if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
            return Center(child: Text('No hay fallas reportadas.'));
          }

          return ListView(
            children:
                snapshot.data!.docs.map((doc) {
                  final data = doc.data() as Map<String, dynamic>;

                  // 🔍 Extraer el área desde la ruta del documento
                  final pathSegments = doc.reference.path.split('/');
                  String area = 'Desconocido';
                  final index = pathSegments.indexOf('areas_hospital');
                  if (index != -1 && index + 1 < pathSegments.length) {
                    area = pathSegments[index + 1];
                  }
                  // Formatear la fecha
                  String fechaFalla = '';
                  if (data['fechaReporte'] != null &&
                      data['fechaReporte'] is Timestamp) {
                    final DateTime fecha =
                        (data['fechaReporte'] as Timestamp).toDate();
                    fechaFalla = DateFormat.yMMMMd('es').add_jm().format(fecha);
                  }

                  return ListTile(
                    leading: Icon(Icons.warning, color: Colors.red),
                    title: Text(data['denominacion'] ?? 'Equipo desconocido'),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Código: ${data['id_equipo'] ?? ''}"),
                        Text("Marca: ${data['marca'] ?? ''}"),
                        Text("Modelo: ${data['modelo'] ?? ''}"),
                        Text("Reportado: $fechaFalla"),
                        Text(
                          "Falla: ${data['descripcion'] ?? 'Sin descripción'}",
                        ),
                      ],
                    ),
                    trailing: Text(
                      area,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                    isThreeLine: true,
                  );
                }).toList(),
          );
        },
      ),
    );
  }
}
