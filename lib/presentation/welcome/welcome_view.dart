import 'package:flutter/material.dart';

import '../../core/app_colors.dart' show AppColors;
import '../../core/assets.dart';

class WelcomeView extends StatefulWidget {
  const WelcomeView({super.key});

  static const routeName = 'welcome';

  @override
  State<WelcomeView> createState() => _WelcomeViewState();
}

class _WelcomeViewState extends State<WelcomeView> {
  @override
  void initState() {
    super.initState();

    Future.delayed(const Duration(seconds: 2), () {
      Navigator.pushNamed(context, 'slides');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.mainRed,

      body: Center(child: Image.asset(Assets.imagesLogo)),
    );
  }
}
