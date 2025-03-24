import 'package:flutter/material.dart';
import 'package:travello/features/auth/presentation/widgets/custom_auth_btn.dart';
import 'package:travello/features/auth/presentation/widgets/custom_text_field.dart';
import 'package:travello/core/app_colors.dart';
import '../widgets/auth_header.dart';

class SignInView extends StatelessWidget {
  const SignInView({super.key});

  static const routeName = 'sign-in';

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
                  title: 'Welcome back',
                  subtitle: 'sign in to access your account',
                ),
                const SizedBox(height: 20),
                CustomTextField(
                  hintText: 'Enter your email',
                  icon: Icons.email,
                ),

                const SizedBox(height: 30),
                CustomTextField(
                  hintText: 'Enter your password',
                  icon: Icons.lock,
                ),

                const SizedBox(height: 17),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Checkbox(value: false, onChanged: (value) {}),
                        const Text(
                          'Remember me',
                          style: TextStyle(
                            color: const Color(0xFF252525),
                            fontSize: 12,
                            fontFamily: 'Mulish',
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ],
                    ),
                    Text(
                      'Forget password ?',
                      style: TextStyle(
                        color: AppColors.mainRed,
                        fontSize: 12,
                        fontFamily: 'Mulish',
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 100),
                CustomAuthBtn(
                  btnTitle: 'Next',
                  icon: Icons.arrow_forward,
                  onPressed: () {
                    Navigator.pushNamed(context, 'verification');
                  },
                ),

                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'New Member ?',
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
                        'Sign Up ',
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
                const SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
