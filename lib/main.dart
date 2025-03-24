import 'package:flutter/material.dart';
import 'package:travello/core/app_routes.dart';
import 'package:travello/presentation/welcome/welcome_view.dart';

void main() {
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
