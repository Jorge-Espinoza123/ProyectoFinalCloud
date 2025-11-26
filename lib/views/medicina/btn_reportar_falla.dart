import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:hospital/widgets/appBar_interfaces_widget.dart';
import 'package:hospital/widgets/button_dual_option_widget.dart';

class reportFalla extends StatefulWidget {
  final Map<String, dynamic> data;
  const reportFalla({super.key, required this.data});
  @override
  State<reportFalla> createState() => _reportFallaState();
}

class _reportFallaState extends State<reportFalla> {
  final TextEditingController _descripcionController = TextEditingController();

  @override
  void dispose() {
    _descripcionController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final data = widget.data;

    return Scaffold(
      appBar: appbarInterfacesWidget(
        nameAppbar: 'Reportar Falla ',
        nameColorText: Colors.black,
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(8, 32, 8, 32),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Nombre del equipo: ${data['denominacion'] ?? ''}"),
            Text("Código: ${data['id_equipo'] ?? ''}"),
            Text("Marca: ${data['marca'] ?? ''}"),
            Text("Modelo: ${data['modelo'] ?? ''}"),
            Text("Código Interno: ${data['codigoInterno'] ?? ''}"),
            Text("Código Patrimonial: ${data['codigoPatrimonial'] ?? ''}"),
            SizedBox(height: 20),
            Text("Descripción de la falla:"),
            SizedBox(height: 8),
            TextField(
              controller: _descripcionController,
              maxLines: 5,
              decoration: InputDecoration(
                hintText: 'Escribe aquí la falla detectada...',
                border: OutlineInputBorder(),
              ),
            ),
            Spacer(),
            Column(
              // mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                // ElevatedButton(
                //   style: ElevatedButton.styleFrom(backgroundColor: Colors.grey),
                //   onPressed: () {
                //     Navigator.pop(context);
                //   },
                //   child: Text('Cancelar'),
                // ),
                // ElevatedButton(
                //   style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
                //   onPressed: () {
                //     final descripcion = _descripcionController.text.trim();

                //     if (descripcion.isEmpty) {
                //       ScaffoldMessenger.of(context).showSnackBar(
                //         SnackBar(content: Text('Por favor describe la falla.')),
                //       );
                //       return;
                //     }

                //     // Aquí puedes agregar lógica para guardar la falla en Firestore
                //     print('Falla reportada: $descripcion');

                //     ScaffoldMessenger.of(context).showSnackBar(
                //       SnackBar(content: Text('Falla reportada con éxito.')),
                //     );

                //     Navigator.pop(context);
                //   },
                //   child: Text('Reportar'),
                // ),
                dualOption(
                  nameOption1: 'Cancelar',
                  nameOption2: 'Reportar',
                  onPressedButton1: () {
                    Navigator.pop(context);
                  },
                  onPressedButton2: () async {
                    final descripcion = _descripcionController.text.trim();

                    if (descripcion.isEmpty) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('Por favor describe la falla.')),
                      );
                      return;
                    }

                    final String? area = widget.data['area'];
                    final String? idEquipo = widget.data['id_equipo'];

                    if (area == null || idEquipo == null) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text('Falta información del equipo.'),
                        ),
                      );
                      return;
                    }

                    try {
                      // 📌 Referencia a la subcolección de fallas del equipo
                      final fallasRef = FirebaseFirestore.instance
                          .collection('hospital')
                          .doc('Categorias')
                          .collection('areas_hospital')
                          .doc(area)
                          .collection('fallas')
                          .doc(idEquipo)
                          .collection('fallas_list'); // subcolección fija

                      // 📌 Contar cuántas fallas ya existen
                      final count = (await fallasRef.get()).size + 1;

                      // 📌 Crear el nombre de la falla: falla_01, falla_02, ...
                      final fallaId =
                          "falla_${count.toString().padLeft(2, '0')}";

                      // 📌 Guardar la nueva falla
                      await fallasRef.doc(fallaId).set({
                        'idFalla': fallaId,
                        'descripcion': descripcion,
                        'id_equipo': idEquipo,
                        'denominacion': widget.data['denominacion'],
                        'marca': widget.data['marca'],
                        'modelo': widget.data['modelo'],
                        'codigoInterno': widget.data['codigoInterno'],
                        'codigoPatrimonial': widget.data['codigoPatrimonial'],
                        'fechaReporte': FieldValue.serverTimestamp(),
                        'estado': 'Pendiente',
                      });

                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('Falla reportada con éxito.')),
                      );

                      Navigator.pop(context);
                    } catch (e) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('Error al reportar falla: $e')),
                      );
                    }
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
