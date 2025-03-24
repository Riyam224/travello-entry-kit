import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
    required this.hintText,
    required this.icon,
  });
  final String hintText;
  final IconData icon;
  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        hintText: hintText,
        filled: true,
        fillColor: Color.fromARGB(255, 244, 235, 235),
        suffixIcon: Icon(icon),
      ),
    );
  }
}
