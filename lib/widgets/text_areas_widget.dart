import 'package:flutter/material.dart';

class TextAreasWidget extends StatelessWidget {
  String nameCategoria;

  TextAreasWidget({required this.nameCategoria});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Padding(
          padding: EdgeInsets.only(left: 72),
          child: Text(
            nameCategoria,
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            textAlign: TextAlign.start,
          ),
        ),
      ],
    );
  }
}
