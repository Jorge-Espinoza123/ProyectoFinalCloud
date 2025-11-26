import 'package:flutter/material.dart';

class CardUserWidget extends StatelessWidget {
  String NombreCompleto;
  String user;
  String rol;
  VoidCallback userIcon;
  VoidCallback deleteIcon;

  CardUserWidget({
    required this.NombreCompleto,
    required this.user,
    required this.rol,
    required this.userIcon,
    required this.deleteIcon,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      elevation: 3,
      margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      child: Padding(
        padding: EdgeInsets.all(12),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Icono izquierdo
            IconButton(
              icon: Icon(
                Icons.account_circle_outlined,
                color: Color.fromARGB(255, 6, 51, 106),
                size: 50,
              ),
              onPressed: userIcon,
            ),
            SizedBox(width: 8),

            // Columna con información
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    NombreCompleto,
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 4),
                  Text(user, style: TextStyle(color: Colors.grey[700])),
                  SizedBox(height: 2),
                  Text(
                    rol,
                    style: TextStyle(color: Colors.grey[600], fontSize: 12),
                  ),
                ],
              ),
            ),

            // Icono de tacho (eliminar)
            IconButton(
              icon: Icon(Icons.delete_outline, color: Colors.red),
              onPressed: deleteIcon,
            ),
          ],
        ),
      ),
    );
  }
}
