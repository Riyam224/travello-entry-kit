import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
    required this.hintText,
    this.suffix,
    this.textInputType,
    this.onSaved,
    this.obscureText = false,
    this.suffixIcon,
  });

  final String hintText;
  final String? suffix;
  final TextInputType? textInputType;
  final void Function(String?)? onSaved;
  final bool obscureText; // public param, no underscore
  final Widget? suffixIcon;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: obscureText, // use public param
      onSaved: onSaved,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Field is empty';
        }
        return null;
      },
      decoration: InputDecoration(
        hintText: hintText,
        filled: true,
        fillColor: Color.fromARGB(255, 244, 235, 235),
        suffixIcon: suffixIcon,
      ),
      keyboardType: textInputType,
    );
  }
}
