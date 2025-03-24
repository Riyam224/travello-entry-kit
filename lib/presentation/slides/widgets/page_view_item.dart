import 'package:flutter/material.dart';

class PageViewItem extends StatelessWidget {
  const PageViewItem({
    super.key,
    required this.image,
    required this.title,
    required this.subtitle,
  });
  final String image;
  final String title;
  final String subtitle;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 28),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(height: MediaQuery.of(context).size.height * 0.2),
          Center(child: Image.asset(image, fit: BoxFit.fill)),
          SizedBox(height: 99.76),
          Text(
            title,
            style: TextStyle(
              color: const Color(0xFF252525),
              fontSize: 36,
              fontFamily: 'Mulish',
              fontWeight: FontWeight.w800,
            ),
          ),
          Text(
            subtitle,
            style: TextStyle(
              color: const Color(0xFF919191),
              fontSize: 24,
              fontFamily: 'Mulish',
              fontWeight: FontWeight.w300,
            ),
          ),
        ],
      ),
    );
  }
}
