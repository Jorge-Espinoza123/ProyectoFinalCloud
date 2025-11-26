import 'package:flutter/material.dart';

class TextLabelWidget extends StatelessWidget {
  String nameLabel;

  TextLabelWidget({required this.nameLabel});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Padding(
          padding: EdgeInsets.only(left: 100, top: 6, bottom: 6),
          child: Text(
            nameLabel,
            style: TextStyle(fontSize: 16),
            textAlign: TextAlign.start,
          ),
        ),
      ],
    );
  }
}
