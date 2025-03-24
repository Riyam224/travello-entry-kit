import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart' show Scaffold;
import 'package:travello/features/auth/presentation/views/sign_in_view.dart';
import 'package:travello/features/home/presentation/views/home_view.dart';
import 'package:travello/features/slides/presentation/views/slides_view.dart';

import '../features/auth/presentation/views/sign_up_view.dart';
import '../features/auth/presentation/views/verification_view.dart';
import '../features/welcome/presentation/views/welcome_view.dart';

Route onGenerateRoute(RouteSettings settings) {
  switch (settings.name) {
    case 'welcome':
      return CupertinoPageRoute(builder: (_) => const WelcomeView());

    case 'slides':
      return CupertinoPageRoute(builder: (_) => SlidesView());

    case 'home':
      return CupertinoPageRoute(builder: (_) => const HomeView());

    case 'sign-in':
      return CupertinoPageRoute(builder: (_) => const SignInView());

    case 'sign-up':
      return CupertinoPageRoute(builder: (_) => const SignUpView());

    case 'verification':
      return CupertinoPageRoute(builder: (_) => const VerificationView());
    default:
      return CupertinoPageRoute(builder: (_) => const Scaffold());
  }
}
