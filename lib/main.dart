import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:travello/core/app_routes.dart';
import 'package:travello/features/welcome/presentation/views/welcome_view.dart';
import 'package:travello/services/shared_prefs.dart';
import 'package:firebase_core/firebase_core.dart';
import 'features/home/presentation/views/home_view.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Prefs.init();
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const Travello());
}

class Travello extends StatelessWidget {
  const Travello({super.key});

  //    @override
  Widget build(BuildContext context) {
    return MaterialApp(
      onGenerateRoute: onGenerateRoute,
      debugShowCheckedModeBanner: false,
      initialRoute: WelcomeView.routeName,
      // Use FutureBuilder to check if the user is logged in and navigate accordingly
      home: FutureBuilder<User?>(
        future: _checkUserLoggedIn(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            // Show a loading indicator while checking auth state
            return const Center(child: CircularProgressIndicator());
          }
          if (snapshot.hasData) {
            // If the user is logged in, navigate to the home page
            return const HomeView(); // Replace with your home view widget
          } else {
            // If no user is logged in, show the welcome screen
            return const WelcomeView();
          }
        },
      ),
    );
  }

  // Check if the user is logged in
  Future<User?> _checkUserLoggedIn() async {
    User? user = FirebaseAuth.instance.currentUser;
    return user;
  }
}
