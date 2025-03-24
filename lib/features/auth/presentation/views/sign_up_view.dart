import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import '../../../../core/app_colors.dart';
import '../widgets/auth_header.dart';
import '../widgets/custom_auth_btn.dart';
import '../widgets/custom_text_field.dart';

class SignUpView extends StatelessWidget {
  const SignUpView({super.key});

  static const routeName = 'sign-up';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 28),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                AuthHeader(
                  title: 'Get Started',
                  subtitle: 'by creating a free account.',
                ),
                const SizedBox(height: 20),
                CustomTextField(hintText: 'Full name', icon: Icons.person),

                const SizedBox(height: 30),
                CustomTextField(hintText: 'Valid email', icon: Icons.email),
                const SizedBox(height: 30),
                CustomTextField(hintText: 'Phone number', icon: Icons.phone),
                const SizedBox(height: 30),
                CustomTextField(hintText: 'Strong Password', icon: Icons.lock),
                const SizedBox(height: 17),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Checkbox(value: false, onChanged: (value) {}),

                        Text.rich(
                          TextSpan(
                            children: [
                              TextSpan(
                                text: 'By checking the box you agree to our ',
                                style: TextStyle(
                                  color: Color(0xFF252525),
                                  fontSize: 9,
                                  fontFamily: 'Mulish',
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              TextSpan(
                                text: 'Terms',
                                style: TextStyle(
                                  color: Color(0xFFFF3951),
                                  fontSize: 9,
                                  fontFamily: 'Mulish',
                                  fontWeight: FontWeight.w400,
                                ),
                                recognizer:
                                    TapGestureRecognizer()
                                      ..onTap = () {
                                        // Handle Terms click event
                                        print("Terms clicked");
                                      },
                              ),
                              TextSpan(
                                text: ' and ',
                                style: TextStyle(
                                  color: Color(0xFF252525),
                                  fontSize: 9,
                                  fontFamily: 'Mulish',
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              TextSpan(
                                text: 'Privacy Policy',
                                style: TextStyle(
                                  color: Color(0xFFFF3951),
                                  fontSize: 9,
                                  fontFamily: 'Mulish',
                                  fontWeight: FontWeight.w400,
                                ),
                                recognizer:
                                    TapGestureRecognizer()
                                      ..onTap = () {
                                        // Handle Privacy Policy click event
                                        print("Privacy Policy clicked");
                                      },
                              ),
                              TextSpan(
                                text: '.',
                                style: TextStyle(
                                  color: Color(0xFF252525),
                                  fontSize: 9,
                                  fontFamily: 'Mulish',
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),

                const SizedBox(height: 50),
                CustomAuthBtn(
                  btnTitle: 'Next',
                  icon: Icons.arrow_forward,
                  onPressed: () {
                    Navigator.pushNamed(context, 'verification');
                  },
                ),

                const SizedBox(height: 40),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Already a member ?',
                      style: TextStyle(
                        color: const Color(0xFF252525),
                        fontSize: 12,
                        fontFamily: 'Mulish',
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    const SizedBox(width: 5),
                    GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, 'sign-up');
                      },
                      child: Text(
                        'Sign In ',
                        style: TextStyle(
                          color: AppColors.mainRed,
                          fontSize: 12,
                          fontFamily: 'Mulish',
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
