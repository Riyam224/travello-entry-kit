import 'package:flutter/material.dart';
import 'package:travello/presentation/auth/widgets/custom_auth_btn.dart';
import 'package:travello/core/app_colors.dart';
import 'dart:math';

class VerificationView extends StatelessWidget {
  const VerificationView({super.key});

  static const routeName = 'verification';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 28),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,

          children: [
            SizedBox(height: 150),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: Text(
                'Almost there ',
                textAlign: TextAlign.start,
                style: TextStyle(
                  color: const Color(0xFF252525),
                  fontSize: 24,
                  fontFamily: 'Mulish',
                  fontWeight: FontWeight.w800,
                ),
              ),
            ),
            SizedBox(height: 25),
            Center(
              child: SizedBox(
                width: 400,
                child: Text.rich(
                  TextSpan(
                    children: [
                      TextSpan(
                        text:
                            'Please enter the 6-digit code sent to your email ',
                        style: TextStyle(
                          color: const Color(0xFF252525),
                          fontSize: 14,
                          fontFamily: 'Mulish',
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                      TextSpan(
                        text: 'contact.uiuxexperts@gmail.com ',
                        style: TextStyle(
                          color: const Color(0xFFFF3951),
                          fontSize: 14,
                          fontFamily: 'Mulish',
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      TextSpan(
                        text: 'for verification.',
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
            SizedBox(height: 30),

            Center(
              child: Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: List.generate(6, (index) {
                    List<int> numbers = List.generate(
                      6,
                      (i) => i + 1,
                    ); // [1, 2, 3, 4, 5, 6]
                    numbers.shuffle(Random()); // Shuffle the numbers randomly

                    return Container(
                      margin: EdgeInsets.symmetric(vertical: 5),
                      padding: EdgeInsets.all(15),
                      decoration: BoxDecoration(
                        color: AppColors.secondaryRed.withOpacity(0.3),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Text(
                        '${numbers[index]}', // Use shuffled numbers
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    );
                  }),
                ),
              ),
            ),
            SizedBox(height: 30),
            CustomAuthBtn(
              btnTitle: 'Next',
              onPressed: () {
                Navigator.pushNamed(context, 'home');
              },
            ),
            SizedBox(height: 40),
            Center(
              child: Text(
                'Didn’t receive any code? Resend Again',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: const Color(0xFF252525),
                  fontSize: 13,
                  fontFamily: 'Mulish',
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
            Center(
              child: Text(
                'Request new code in 00:30s',
                style: TextStyle(
                  color: Colors.black.withValues(alpha: 128),
                  fontSize: 13,
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
