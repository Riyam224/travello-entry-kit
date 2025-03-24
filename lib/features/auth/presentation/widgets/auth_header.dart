import 'package:flutter/material.dart';
import 'package:travello/core/assets.dart';

class AuthHeader extends StatelessWidget {
  const AuthHeader({super.key, required this.title, required this.subtitle});
  final String title, subtitle;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 52),
      child: Stack(
        children: [
          SizedBox(
            width: 321,
            height: 321,

            child: Center(
              child: Image.asset(Assets.imagesAuth, fit: BoxFit.cover),
            ),
          ),
          Positioned(
            top: 155,
            right: 60,
            child: Container(
              height: 100,

              child: Center(
                child: Column(
                  children: [
                    Text(
                      title,
                      style: TextStyle(
                        color: const Color(0xFF252525),
                        fontSize: 28,
                        fontFamily: 'Mulish',
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                    Text(
                      subtitle,
                      style: TextStyle(
                        color: const Color(0xFF252525),
                        fontSize: 14,
                        fontFamily: 'Mulish',
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
