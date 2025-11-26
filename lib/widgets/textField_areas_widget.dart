import 'package:flutter/material.dart';

class TextfieldAreasWidget extends StatelessWidget {
  String nameOption;
  double paddingLeft;
  double paddingRight;
  TextEditingController typeController;

  TextfieldAreasWidget({
    required this.nameOption,
    required this.typeController,
    this.paddingLeft = 72,
    this.paddingRight = 72,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.only(left: paddingLeft, right: paddingRight),
          child: Container(
            height: 45,
            child: TextField(
              controller: typeController,
              style: TextStyle(color: Colors.black),
              decoration: InputDecoration(
                hintText: nameOption,
                hintStyle: TextStyle(color: Colors.black12),
                filled: true,
                fillColor: Colors.transparent,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
                contentPadding: EdgeInsets.symmetric(
                  horizontal: 15,
                  vertical: 12,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
