import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CardEquipoWidgetnoEdit extends StatelessWidget {
  String codigo;
  String nombre;
  String anios;
  String marca;
  String modelo;
  String codigoInterno;
  String codigoPatrimonial;
  String fechaIngreso;
  String ubicacion;
  String estado;
  // VoidCallback editIcon;
  // VoidCallback deleteIcon;

  CardEquipoWidgetnoEdit({
    required this.codigo,
    required this.nombre,
    required this.anios,
    required this.marca,
    required this.modelo,
    required this.codigoInterno,
    required this.codigoPatrimonial,
    required this.fechaIngreso,
    required this.ubicacion,
    required this.estado,
    // required this.editIcon,
    // required this.deleteIcon,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
        side: BorderSide(color: Colors.black12),
      ),

      elevation: 3,
      margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '$codigo',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                    Text(
                      '$nombre',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),

                Container(
                  padding: EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                  decoration: BoxDecoration(
                    color: Colors.blue.shade50,
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(color: Colors.blue),
                  ),
                  child: Text(
                    '$anios años',
                    style: TextStyle(
                      color: Colors.blue[800],
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 8),

            // Información técnica
            Text('Marca: $marca'),
            Text('Modelo: $modelo'),
            Text('Código Interno: $codigoInterno'),
            Text('Código Patrimonial: $codigoPatrimonial'),
            Text('Fecha de ingreso: $fechaIngreso'),
            Text('Ubicación: $ubicacion'),

            SizedBox(height: 12),

            // Fila final con estado + botones
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                  decoration: BoxDecoration(
                    color: Colors.green.shade50,
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(color: Colors.green),
                  ),
                  child: Text(
                    estado,
                    style: TextStyle(
                      color: Colors.green[800],
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                // Row(
                //   children: [
                //     IconButton(
                //       icon: Icon(Icons.edit, color: Colors.blue),
                //       onPressed: editIcon,
                //     ),
                //     IconButton(
                //       icon: Icon(Icons.delete, color: Colors.red),
                //       onPressed: deleteIcon,
                //     ),
                //   ],
                // ),
              ],
            ),

            SizedBox(height: 8),

            // Botón inferior
            Align(
              // alignment: Alignment.centerRight,
              child: ElevatedButton(
                onPressed: () {
                  // Acción del botón
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color.fromARGB(255, 217, 217, 217),
                  minimumSize: Size(350, 40),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                    side: BorderSide(color: Colors.black),
                  ),
                ),
                child: Text(
                  'Ver historial de mantenimiento',
                  style: TextStyle(color: Colors.black),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
