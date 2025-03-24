import 'package:flutter/material.dart';
import 'package:travello/core/assets.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  static const routeName = 'home';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 28),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,

          children: [
            SizedBox(height: 173),
            Text(
              'Welcome To Home',
              style: TextStyle(
                color: const Color(0xFF252525),
                fontSize: 24,
                fontFamily: 'Mulish',
                fontWeight: FontWeight.w800,
              ),
            ),
            SizedBox(height: 71),
            Center(child: Image.asset(Assets.imagesWelcomeToHome)),
            SizedBox(height: 53),
            SizedBox(
              width: 310,
              child: Text(
                'Currently The Next Part of Home Activity & Fragementation is under development. The upcoming Part 2 is coming Soon........',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: const Color(0xFF252525),
                  fontSize: 14,
                  fontFamily: 'Mulish',
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
