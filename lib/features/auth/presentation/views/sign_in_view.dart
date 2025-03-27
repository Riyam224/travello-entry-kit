import 'package:flutter/material.dart';
import 'package:travello/features/auth/presentation/widgets/custom_auth_btn.dart';
import 'package:travello/features/auth/presentation/widgets/custom_text_field.dart';
import 'package:travello/core/app_colors.dart';
import 'package:travello/features/home/presentation/views/home_view.dart'; // Import Home View
import 'package:firebase_auth/firebase_auth.dart'; // Import Firebase Auth
import '../widgets/auth_header.dart';

class SignInView extends StatefulWidget {
  const SignInView({super.key});

  static const routeName = 'sign-in';

  @override
  _SignInViewState createState() => _SignInViewState();
}

class _SignInViewState extends State<SignInView> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _isLoading = false;
  String? _errorMessage;

  // Method to sign in the user
  Future<void> _signIn() async {
    setState(() {
      _isLoading = true;
      _errorMessage = null; // Reset any previous errors
    });

    try {
      UserCredential userCredential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(
            email: _emailController.text.trim(),
            password: _passwordController.text.trim(),
          );

      // Navigate to the home page after successful sign-in
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const HomeView()),
      );
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
                  title: 'Welcome back',
                  subtitle: 'Sign in to access your account',
                ),
                const SizedBox(height: 20),

                // Email Text Field
                CustomTextField(
                  controller: _emailController,
                  hintText: 'Enter your email',
                  icon: Icons.email,
                ),

                const SizedBox(height: 30),

                // Password Text Field
                CustomTextField(
                  controller: _passwordController,
                  hintText: 'Enter your password',
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

                // Sign In Button
                CustomAuthBtn(
                  btnTitle: _isLoading ? 'Loading...' : 'Next',
                  icon: Icons.arrow_forward,
                  onPressed:
                      _isLoading
                          ? null
                          : _signIn, // Disable button while loading
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
                        'Sign Up',
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
