import 'package:flutter/material.dart';

import '../../../core/app_colors.dart';

class CustomAuthBtn extends StatelessWidget {
  const CustomAuthBtn({
    super.key,
    required this.btnTitle,
    this.icon,
    this.onPressed,
  });
  final String btnTitle;
  final IconData? icon;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.mainRed,
        minimumSize: const Size(315, 50),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            btnTitle,
            style: TextStyle(
              color: Colors.white,
              fontSize: 16,
              fontFamily: 'Mulish',
              fontWeight: FontWeight.w700,
            ),
          ),
          SizedBox(width: 8),
          Icon(icon, color: Colors.white),
        ],
      ),
    );
  }
}
