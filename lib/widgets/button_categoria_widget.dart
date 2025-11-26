import 'package:flutter/material.dart';

class ButtonCategoriaWidget extends StatelessWidget {
  String option1;
  String option2;
  String option3;
  void Function(String?) typeController;
  String textoFondo;

  ButtonCategoriaWidget({
    required this.option1,
    required this.option2,
    required this.option3,
    required this.textoFondo,
    required this.typeController,
  });

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<String>(
      value: null,
      onChanged: typeController,
      items: [
        DropdownMenuItem(value: option1, child: Text(option1)),
        DropdownMenuItem(value: option2, child: Text(option2)),
        DropdownMenuItem(value: option3, child: Text(option3)),
      ],
      decoration: InputDecoration(
        hintText: textoFondo,
        hintStyle: TextStyle(color: Colors.black12),
        filled: true,
        fillColor: Colors.transparent,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(16)),
        isDense: true,
        contentPadding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      ),
      style: TextStyle(color: Colors.black),
      dropdownColor: Colors.white,
    );
  }
}
