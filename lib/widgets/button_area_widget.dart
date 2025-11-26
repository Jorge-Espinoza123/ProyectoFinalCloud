import 'package:flutter/material.dart';

class ButtonAreaWidget extends StatelessWidget {
  String option1;
  String option2;
  String option3;
  String option4;
  String option5;
  String option6;
  String option7;
  void Function(String?) typeController;
  String textoFondo;

  ButtonAreaWidget({
    required this.option1,
    required this.option2,
    required this.option3,
    required this.option4,
    required this.option5,
    required this.option6,
    required this.option7,
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
        DropdownMenuItem(value: option4, child: Text(option4)),
        DropdownMenuItem(value: option5, child: Text(option5)),
        DropdownMenuItem(value: option6, child: Text(option6)),
        DropdownMenuItem(value: option7, child: Text(option7)),
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
