import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:travello/core/app_colors.dart';
import 'package:travello/presentation/auth/views/sign_in_view.dart';
import 'package:travello/presentation/slides/widgets/custom_circle_button.dart';
import '../widgets/slide_page_view.dart';

class SlidesView extends StatefulWidget {
  SlidesView({super.key});

  static const routeName = 'slides';

  @override
  State<SlidesView> createState() => _SlidesViewState();
}

class _SlidesViewState extends State<SlidesView> {
  late PageController pageController;
  var currentPage = 0;
  @override
  void initState() {
    pageController = PageController();
    pageController.addListener(() {
      setState(() {
        currentPage = pageController.page!.round();
      });
    });
    super.initState();
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(child: SlidePageView(pageController: pageController)),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 28),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                DotsIndicator(
                  dotsCount: 3,
                  position: currentPage.toDouble(), // 🚀 Smooth movement
                  decorator: DotsDecorator(
                    size: const Size(16, 6), // Custom shape (rounded rectangle)
                    activeSize: const Size(24, 8), // Larger active dot
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(4), // Rounded corners
                    ),
                    activeShape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(
                        6,
                      ), // More rounded when active
                    ),
                    color: Colors.grey.shade400, // Inactive color
                    activeColor: AppColors.mainRed, // Active color
                  ),
                ),
                CustomCircleButton(
                  onPressed: () {
                    if (currentPage == 3 - 1) {
                      // Navigate to HomeView when on the last page
                      Navigator.of(context).pushReplacement(
                        MaterialPageRoute(
                          builder: (context) => const SignInView(),
                        ),
                      );
                    } else {
                      // Move to the next page if not on the last page
                      pageController.nextPage(
                        duration: const Duration(milliseconds: 400),
                        curve: Curves.easeInOut,
                      );
                    }
                  },
                ),
              ],
            ),
          ),
          SizedBox(height: 60),
        ],
      ),
    );
  }
}
