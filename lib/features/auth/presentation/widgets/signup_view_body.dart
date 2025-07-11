// ignore_for_file: avoid_print

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travello/core/utils/app_colors.dart';
import 'package:travello/features/auth/presentation/cubit/signup/signup_cubit.dart';
import 'package:travello/features/auth/presentation/widgets/auth_header.dart';
import 'package:travello/features/auth/presentation/widgets/custom_auth_btn.dart';
import 'package:travello/features/auth/presentation/widgets/custom_text_field.dart';

class SignupViewBody extends StatefulWidget {
  const SignupViewBody({super.key});

  @override
  State<SignupViewBody> createState() => _SignupViewBodyState();
}

class _SignupViewBodyState extends State<SignupViewBody> {
  // todo
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  String? email, name, password, phone;
  late bool isTermsAccepted = false;
  bool _obscureText = true; // state variable for toggle

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: SingleChildScrollView(
          // todo
          child: Form(
            key: formKey,
            autovalidateMode: autovalidateMode,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                AuthHeader(
                  title: 'Get Started',
                  subtitle: 'by creating a free account.',
                ),
                // const SizedBox(height: 20),
                // todo
                CustomTextField(
                  hintText: 'Full name',
                  suffixIcon: Icon(Icons.person),
                  onSaved: (value) {
                    name = value;
                  },
                ),

                const SizedBox(height: 30),
                CustomTextField(
                  hintText: 'Valid email',
                  suffixIcon: Icon(Icons.email),

                  onSaved: (value) {
                    email = value;
                  },
                ),
                const SizedBox(height: 30),
                CustomTextField(
                  hintText: 'Phone number',
                  onSaved: (value) => phone = value,
                  suffixIcon: Icon(Icons.phone),
                ),
                const SizedBox(height: 30),
                // todo password
                CustomTextField(
                  hintText: 'Strong Password',
                  obscureText: _obscureText, // pass current state
                  onSaved: (value) => password = value,
                  // todo
                  suffixIcon: GestureDetector(
                    onTap: () {
                      setState(() {
                        _obscureText = !_obscureText; // toggle state
                      });
                    },
                    child: Icon(
                      _obscureText ? Icons.visibility_off : Icons.visibility,
                    ),
                  ),
                ),
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
                // TermsAndConditionsWidget(
                //   onChanged: (value) {
                //     isTermsAccepted = value;
                //     setState(() {});
                //   },
                // ),
                const SizedBox(height: 50),
                CustomAuthBtn(
                  btnTitle: 'Next',
                  icon: Icons.arrow_forward,
                  onPressed: () {
                    if (formKey.currentState?.validate() ?? false) {
                      formKey.currentState!.save();
                      if (email != null &&
                          password != null &&
                          name != null &&
                          phone != null) {
                        context
                            .read<SignupCubit>()
                            .createUserWithEmailandPassword(
                              email: email!,
                              password: password!,
                              name: name!,
                              phone: phone!,
                            );
                        Navigator.pushNamed(context, 'home');
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('Please accept terms and conditions'),
                          ),
                        );
                      }
                    }
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
                        Navigator.pushNamed(context, 'sign-in');
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
