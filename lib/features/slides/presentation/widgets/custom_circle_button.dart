import 'package:flutter/material.dart';

class CustomCircleButton extends StatelessWidget {
  const CustomCircleButton({super.key, required this.onPressed});
  final void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        shape: const CircleBorder(),
        backgroundColor: Colors.black,
        padding: const EdgeInsets.all(22),
      ),
      child: Center(
        child: Icon(Icons.arrow_forward_ios, color: Colors.white, size: 20),
      ),
    );
  }
}
