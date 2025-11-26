import 'package:flutter/material.dart';

class dualOption extends StatelessWidget {
  String nameOption1;
  String nameOption2;
  VoidCallback onPressedButton1;
  VoidCallback onPressedButton2;
  double paddingHorizontal;
  double buttonHorizontal;
  double buttonVertical;

  dualOption({
    required this.nameOption1,
    required this.nameOption2,
    required this.onPressedButton1,
    required this.onPressedButton2,
    this.paddingHorizontal = 55,
    this.buttonHorizontal = 32,
    this.buttonVertical = 9,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: paddingHorizontal),
      child: Row(
        children: [
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              padding: EdgeInsets.symmetric(
                horizontal: buttonHorizontal,
                vertical: buttonVertical,
              ),
              backgroundColor: Colors.red,
              elevation: 5,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
            onPressed: onPressedButton1,
            child: Text(
              nameOption1,
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          SizedBox(width: 20),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              padding: EdgeInsets.symmetric(
                horizontal: buttonHorizontal,
                vertical: buttonVertical,
              ),
              backgroundColor: Color.fromARGB(255, 6, 51, 106),
              elevation: 5,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
            onPressed: onPressedButton2,
            child: Text(
              nameOption2,
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
