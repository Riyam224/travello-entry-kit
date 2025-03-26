import 'package:flutter/material.dart';
import 'package:travello/core/app_routes.dart';
import 'package:travello/features/welcome/presentation/views/welcome_view.dart';
import 'package:travello/services/shared_prefs.dart';
import 'package:firebase_core/firebase_core.dart';
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

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      onGenerateRoute: onGenerateRoute,
      debugShowCheckedModeBanner: false,
      initialRoute: WelcomeView.routeName,
    );
  }
}
