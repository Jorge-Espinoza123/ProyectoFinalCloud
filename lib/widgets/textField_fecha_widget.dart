import 'package:flutter/material.dart';

class TextfieldFechaWidget extends StatelessWidget {
  final TextEditingController dayController;
  final TextEditingController monthController;
  final TextEditingController yearController;

  TextfieldFechaWidget({
    Key? key,
    required this.dayController,
    required this.monthController,
    required this.yearController,
  }) : super(key: key);

  Widget _buildDateField(
    TextEditingController controller,
    String hint,
    int maxLength,
  ) {
    return SizedBox(
      width: 80,
      height: 40,
      child: TextField(
        controller: controller,
        maxLength: maxLength,
        keyboardType: TextInputType.number,
        decoration: InputDecoration(
          counterText: '',
          hintText: hint,
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
          contentPadding: EdgeInsets.symmetric(vertical: 8, horizontal: 8),
        ),
        style: TextStyle(fontSize: 16),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _buildDateField(dayController, 'DD', 2),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 4),
          child: Text(
            '/',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
        ),
        _buildDateField(monthController, 'MM', 2),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 4),
          child: Text(
            '/',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
        ),
        _buildDateField(yearController, 'AAAA', 4),
      ],
    );
  }
}
