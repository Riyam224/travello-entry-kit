import 'package:flutter/material.dart';
import 'package:travello/core/services/get_it_service.dart';
import 'package:travello/core/utils/app_routes.dart';
import 'package:travello/features/welcome/presentation/views/welcome_view.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  // todo get it singeleton
  setup();
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
