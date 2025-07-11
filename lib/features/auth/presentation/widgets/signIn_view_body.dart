import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travello/core/utils/app_colors.dart';
import 'package:travello/features/auth/presentation/cubit/signin/signin_cubit.dart';
import 'package:travello/features/auth/presentation/widgets/auth_header.dart';
import 'package:travello/features/auth/presentation/widgets/custom_auth_btn.dart';
import 'package:travello/features/auth/presentation/widgets/custom_text_field.dart';

class SignInViewBody extends StatefulWidget {
  const SignInViewBody({super.key});

  @override
  State<SignInViewBody> createState() => _SignInViewBodyState();
}

class _SignInViewBodyState extends State<SignInViewBody> {
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
        padding: const EdgeInsets.symmetric(horizontal: 28),
        child: SingleChildScrollView(
          child: Form(
            key: formKey,
            autovalidateMode: autovalidateMode,
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
                  onSaved: (value) => email = value,
                  textInputType: TextInputType.emailAddress,
                  hintText: 'Enter your email',
                  suffixIcon: Icon(Icons.email),
                ),

                const SizedBox(height: 30),
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
                        const Text(
                          'Remember me',
                          style: TextStyle(
                            color: Color(0xFF252525),
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
                    final currentState = formKey.currentState;
                    if (currentState != null && currentState.validate()) {
                      currentState.save();

                      if (email != null && password != null) {
                        context.read<SigninCubit>().signInWithEmailandPassword(
                          email: email!,
                          password: password!,
                        );
                        Navigator.pushNamed(context, 'home');
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('Email or password is missing'),
                          ),
                        );
                      }
                    } else {
                      setState(() {
                        autovalidateMode = AutovalidateMode.always;
                      });
                    }
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
