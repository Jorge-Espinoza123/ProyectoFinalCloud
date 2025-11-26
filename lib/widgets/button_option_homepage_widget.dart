import 'package:flutter/material.dart';

class OptionButton extends StatelessWidget {
  final IconData icon; // ← icono en lugar de imagen
  final String text;
  final VoidCallback onPressed;
  final double iconSize;

  const OptionButton({
    Key? key,
    required this.icon,
    required this.text,
    required this.onPressed,
    this.iconSize = 60.0, // ← tamaño del icono
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        padding: EdgeInsets.symmetric(horizontal: 26, vertical: 12),
        backgroundColor: Colors.white,
        elevation: 5,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
          side: BorderSide(color: Colors.black, width: 2),
        ),
      ),
      onPressed: onPressed,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: iconSize, color: Colors.black),
          SizedBox(height: 8),
          Text(
            text,
            style: TextStyle(fontSize: 13, color: Colors.black),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
