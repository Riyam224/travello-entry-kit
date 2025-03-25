import 'package:flutter/material.dart';
import 'package:travello/core/constants.dart';
import 'package:travello/services/shared_prefs.dart';

import '../../../../core/app_colors.dart' show AppColors;
import '../../../../core/assets.dart';

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
    excuteNavigation();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.mainRed,
      body: Center(child: Image.asset(Assets.imagesLogo)),
    );
  }

  // todo add shared preferences to move directly from welcome to sing in when the user already seen the slides
  void excuteNavigation() {
    bool isSlidesViewSeen = Prefs.getBool(kIsSlidesSeen);
    Future.delayed(Duration(seconds: 2), () {
      if (isSlidesViewSeen) {
        Navigator.of(context).pushReplacementNamed('sign-in');
        return;
      }
      Navigator.of(context).pushReplacementNamed('slides');
    });
  }
}
