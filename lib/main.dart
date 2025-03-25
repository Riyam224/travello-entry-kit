import 'package:flutter/material.dart';
import 'package:travello/core/app_routes.dart';
import 'package:travello/features/welcome/presentation/views/welcome_view.dart';
import 'package:travello/services/shared_prefs.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Prefs.init();
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
