import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:travello/features/auth/presentation/views/sign_in_view.dart';
import 'package:travello/features/slides/presentation/widgets/custom_circle_button.dart';

class IndicatorAndBtn extends StatelessWidget {
  const IndicatorAndBtn({
    super.key,
    required this.currentPage,
    required this.totalPages,
    required this.pageController,
  });
  final int currentPage;
  final int totalPages;
  final PageController pageController;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 28),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          DotsIndicator(dotsCount: 3),
          CustomCircleButton(
            onPressed: () {
              if (currentPage == totalPages - 1) {
                Navigator.of(context).pushReplacement(
                  MaterialPageRoute(builder: (context) => const SignInView()),
                );
              }
              pageController.nextPage(
                duration: const Duration(milliseconds: 400),
                curve: Curves.easeInOut,
              );
            },
          ),
        ],
      ),
    );
  }
}
