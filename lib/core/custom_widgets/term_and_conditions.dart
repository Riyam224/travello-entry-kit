// import 'package:flutter/material.dart';
// import 'package:flutter/widgets.dart';
// import 'package:travello/core/custom_widgets/custom_checker_box.dart';
// import 'package:travello/core/utils/app_colors.dart';
// import 'package:travello/core/utils/app_text_styles.dart';

// class TermsAndConditionsWidget extends StatefulWidget {
//   const TermsAndConditionsWidget({super.key, required this.onChanged});
//   // todo put it here cuz gonna send it to another widget
//   final ValueChanged<bool> onChanged;
//   @override
//   State<TermsAndConditionsWidget> createState() =>
//       _TermsAndConditionsWidgetState();
// }

// class _TermsAndConditionsWidgetState extends State<TermsAndConditionsWidget> {
//   bool isTermsAccepted = false;
//   @override
//   Widget build(BuildContext context) {
//     return Row(
//       children: [
//         CustomCheckBox(
//           onChecked: (value) {
//             isTermsAccepted = value;
//             widget.onChanged(value);
//             setState(() {});
//           },
//           isChecked: isTermsAccepted,
//         ),
//         const SizedBox(width: 16),
//         Expanded(
//           child: Text.rich(
//             TextSpan(
//               children: [
//                 TextSpan(
//                   text: 'من خلال إنشاء حساب ، فإنك توافق على ',
//                   style: TextStyles.semiBold13.copyWith(
//                     color: const Color(0xFF949D9E),
//                   ),
//                 ),
//                 TextSpan(
//                   text: 'الشروط والأحكام',
//                   style: TextStyles.semiBold13.copyWith(
//                     color: AppColors.secondaryRed,
//                   ),
//                 ),
//                 const TextSpan(text: ' ', style: TextStyles.semiBold13),
//                 TextSpan(
//                   text: 'الخاصة',
//                   style: TextStyles.semiBold13.copyWith(
//                     color: AppColors.secondaryRed,
//                   ),
//                 ),
//                 const TextSpan(text: ' ', style: TextStyles.semiBold13),
//                 TextSpan(
//                   text: 'بنا',
//                   style: TextStyles.semiBold13.copyWith(
//                     color: AppColors.secondaryRed,
//                   ),
//                 ),
//               ],
//             ),
//             textAlign: TextAlign.right,
//           ),
//         ),
//       ],
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'package:travello/core/custom_widgets/custom_checker_box.dart';
import 'package:travello/core/utils/app_colors.dart';
import 'package:travello/core/utils/app_text_styles.dart';

class TermsAndConditionsWidget extends StatefulWidget {
  const TermsAndConditionsWidget({super.key, required this.onChanged});
  final ValueChanged<bool> onChanged;

  @override
  State<TermsAndConditionsWidget> createState() =>
      _TermsAndConditionsWidgetState();
}

class _TermsAndConditionsWidgetState extends State<TermsAndConditionsWidget> {
  bool isTermsAccepted = false;
  late TapGestureRecognizer _tapRecognizer;

  @override
  void initState() {
    super.initState();
    _tapRecognizer =
        TapGestureRecognizer()
          ..onTap = () {
            Navigator.pushNamed(context, '/terms'); // Navigate to Terms page
          };
  }

  @override
  void dispose() {
    _tapRecognizer.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CustomCheckBox(
          onChecked: (value) {
            isTermsAccepted = value;
            widget.onChanged(value);
            setState(() {});
          },
          isChecked: isTermsAccepted,
        ),
        const SizedBox(width: 16),
        Expanded(
          child: Text.rich(
            TextSpan(
              children: [
                TextSpan(
                  text: 'By creating an account, you agree to the ',
                  style: TextStyles.semiBold13.copyWith(
                    color: const Color(0xFF949D9E),
                  ),
                ),
                TextSpan(
                  text: 'Terms and Conditions',
                  style: TextStyles.semiBold13.copyWith(
                    color: AppColors.secondaryRed,
                  ),
                  recognizer: _tapRecognizer,
                ),
                TextSpan(
                  text: ' of our service.',
                  style: TextStyles.semiBold13.copyWith(
                    color: const Color(0xFF949D9E),
                  ),
                ),
              ],
            ),
            textAlign: TextAlign.left,
          ),
        ),
      ],
    );
  }
}
