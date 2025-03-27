import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart'; // Import Firebase Auth
import '../../../../core/app_colors.dart';
import '../widgets/auth_header.dart';
import '../widgets/custom_auth_btn.dart';
import '../widgets/custom_text_field.dart';

class SignUpView extends StatefulWidget {
  const SignUpView({super.key});

  static const routeName = 'sign-up';

  @override
  _SignUpViewState createState() => _SignUpViewState();
}

class _SignUpViewState extends State<SignUpView> {
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _phoneController = TextEditingController();
  final _passwordController = TextEditingController();

  bool _isLoading = false;
  String? _errorMessage;

  // Method to sign up the user
  Future<void> _signUp() async {
    setState(() {
      _isLoading = true;
      _errorMessage = null;
    });

    try {
      UserCredential userCredential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(
            email: _emailController.text.trim(),
            password: _passwordController.text.trim(),
          );

      // You can store additional user information (like name and phone) in Firestore here.

      // Navigate to the verification page or home page after successful sign-up
      Navigator.pushReplacementNamed(context, 'verification');
    } on FirebaseAuthException catch (e) {
      setState(() {
        _isLoading = false;
        _errorMessage = e.message; // Show the error message if any
      });
    }
  }

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

                // Full Name Text Field
                CustomTextField(
                  controller: _nameController,
                  hintText: 'Full name',
                  icon: Icons.person,
                ),

                const SizedBox(height: 30),

                // Email Text Field
                CustomTextField(
                  controller: _emailController,
                  hintText: 'Valid email',
                  icon: Icons.email,
                ),

                const SizedBox(height: 30),

                // Phone Number Text Field
                CustomTextField(
                  controller: _phoneController,
                  hintText: 'Phone number',
                  icon: Icons.phone,
                ),

                const SizedBox(height: 30),

                // Password Text Field
                CustomTextField(
                  controller: _passwordController,
                  hintText: 'Strong Password',
                  icon: Icons.lock,
                ),

                // Error Message Display
                if (_errorMessage != null)
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: Text(
                      _errorMessage!,
                      style: const TextStyle(color: Colors.red),
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

                const SizedBox(height: 50),

                // Sign Up Button
                CustomAuthBtn(
                  btnTitle: _isLoading ? 'Loading...' : 'Next',
                  icon: Icons.arrow_forward,
                  onPressed:
                      _isLoading
                          ? null
                          : _signUp, // Disable button while loading
                ),

                const SizedBox(height: 40),

                // Sign In Link
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
                        'Sign In',
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
