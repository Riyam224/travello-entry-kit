import 'package:flutter/material.dart';
import 'package:travello/core/assets.dart';
import 'package:travello/features/slides/presentation/widgets/page_view_item.dart';

class SlidePageView extends StatelessWidget {
  const SlidePageView({super.key, required this.pageController});
  final PageController pageController;
  @override
  Widget build(BuildContext context) {
    return PageView(
      controller: pageController,
      children: [
        PageViewItem(
          image: Assets.imagesSlide1,
          title: 'Explore the \nworld easily',
          subtitle: 'To your desire',
        ),
        PageViewItem(
          image: Assets.imagesSlide2,
          title: 'Reach the unknown spot',
          subtitle: 'To your destination',
        ),
        PageViewItem(
          image: Assets.imagesSlide3,
          title: 'Make connects with Travello',
          subtitle: 'To your dream trip',
        ),
      ],
    );
  }
}
