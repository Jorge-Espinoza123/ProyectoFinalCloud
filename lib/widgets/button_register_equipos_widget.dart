import 'package:flutter/material.dart';

// ignore: must_be_immutable
class ButtonRegisterEquipoWidget extends StatelessWidget {
  String option1;
  String option2;
  String option3;
  String option4;
  void Function(String?) typeController;
  String textoFondo;

  ButtonRegisterEquipoWidget({
    required this.option1,
    required this.option2,
    required this.option3,
    required this.option4,
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
      ],
      decoration: InputDecoration(
        hintText: textoFondo,
        hintStyle: TextStyle(color: Colors.black12),
        filled: true,
        fillColor: Colors.transparent,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(16)),
        isDense: true,
        contentPadding: EdgeInsets.symmetric(horizontal: 8, vertical: 8),
      ),

      style: TextStyle(color: Colors.black),
      dropdownColor: Colors.white,
    );
  }
}

// class ButtonRegisterEquipoWidget extends StatelessWidget {
//   final List<String> opciones;
//   final String? valor;
//   final ValueChanged<String?> onChanged;
//   final String textoFondo;

//   ButtonRegisterEquipoWidget({
//     required this.opciones,
//     required this.valor,
//     required this.onChanged,
//     required this.textoFondo,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return DropdownButtonFormField<String>(
//       value: valor,
//       onChanged: onChanged,
//       items:
//           opciones
//               .map((o) => DropdownMenuItem(value: o, child: Text(o)))
//               .toList(),
//       decoration: InputDecoration(
//         hintText: textoFondo,
//         hintStyle: TextStyle(color: Colors.black12),
//         border: OutlineInputBorder(borderRadius: BorderRadius.circular(16)),
//         isDense: true,
//         contentPadding: EdgeInsets.symmetric(horizontal: 12, vertical: 12),
//       ),
//     );
//   }
// }
