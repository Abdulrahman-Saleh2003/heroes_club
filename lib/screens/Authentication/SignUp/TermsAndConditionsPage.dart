// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
//
// class TermsAndConditionsPage extends StatelessWidget {
//   const TermsAndConditionsPage({
//     super.key,
//     required this.agreeToTerms,
//     required this.onChanged,
//   });
//
//   final bool agreeToTerms;
//   final ValueChanged<bool?> onChanged;
//
//   @override
//   Widget build(BuildContext context) {
//     return Row(
//       children: [
//         Checkbox(
//           value: agreeToTerms,
//           onChanged: onChanged, // استخدم callback هنا
//           activeColor: const Color(0xFFFFD700),
//           checkColor: Colors.black,
//         ),
//         Expanded(
//           child: Text(
//             'أوافق على الخصوصية وسياسة الأحكام والشروط',
//             style: const TextStyle(color: Colors.white70, fontSize: 14),
//           ),
//         ),
//       ],
//     );
//   }
// }


import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class TermsAndConditions extends StatelessWidget {
  const TermsAndConditions({
    super.key,
    required this.value,
    required this.onChanged,
    this.onTapTerms, // اختياري: إذا بدك تفتح صفحة شروط
  });

  final bool value;
  final ValueChanged<bool> onChanged;
  final VoidCallback? onTapTerms;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Checkbox(
          value: value,
          onChanged: (bool? newValue) {
            if (newValue != null) {
              onChanged(newValue);
            }
          },
          activeColor: const Color(0xFFFFD700),
          checkColor: Colors.black,
          materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
        ),
        const SizedBox(width: 8),
        Expanded(
          child: RichText(
            text: TextSpan(
              style: const TextStyle(color: Colors.white70, fontSize: 14),
              children: [
                const TextSpan(text: 'أوافق على '),
                TextSpan(
                  text: 'سياسة الخصوصية',
                  style: const TextStyle(
                    color: Color(0xFFFFD700),
                    decoration: TextDecoration.underline,
                  ),
                  recognizer: TapGestureRecognizer()
                    ..onTap = onTapTerms ?? () {
                      // يمكن تضيف هنا Navigator.push لصفحة الخصوصية
                      debugPrint('فتح سياسة الخصوصية');
                    },
                ),
                const TextSpan(text: ' و'),
                TextSpan(
                  text: 'الشروط والأحكام',
                  style: const TextStyle(
                    color: Color(0xFFFFD700),
                    decoration: TextDecoration.underline,
                  ),
                  recognizer: TapGestureRecognizer()
                    ..onTap = onTapTerms ?? () {
                      debugPrint('فتح الشروط والأحكام');
                    },
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}