// import 'package:flutter/material.dart';
// class SignUpButton extends StatelessWidget {
//   final bool isEnabled;
//   final VoidCallback onPressed;
//   final String label;
//
//   const SignUpButton({
//     super.key,
//     required this.isEnabled,
//     required this.onPressed,  this.label=  'إنشاء حساب',
//   });
//
//   @override
//   Widget build(BuildContext context) {
//     return SizedBox(
//       width: double.infinity,
//       height: 56,
//       child: ElevatedButton(
//
//         onPressed: isEnabled ? onPressed : null,
//         style: ElevatedButton.styleFrom(
//           backgroundColor: const Color(0xFFFFD700),
//           foregroundColor: Colors.black,
//           disabledBackgroundColor: Colors.grey[800],
//           shape: RoundedRectangleBorder(
//             borderRadius: BorderRadius.circular(30),
//           ),
//           elevation: 0,
//         ),
//         child:  Text(
//           label,
//           style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
//         ),
//       ),
//     );
//   }
// }
//


import 'package:flutter/material.dart';

class SignUpButton extends StatelessWidget {
  const SignUpButton({
    super.key,
    required this.isEnabled,
    required this.isLoading,
    required this.onPressed,
    this.label = 'إنشاء حساب',
  });

  final bool isEnabled;
  final bool isLoading;
  final VoidCallback onPressed;
  final String label;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 56,
      child: ElevatedButton(
        onPressed: isEnabled && !isLoading ? onPressed : null,
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color(0xFFFFD700),
          foregroundColor: Colors.black,
          disabledBackgroundColor: Colors.grey[800],
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
          elevation: isEnabled ? 2 : 0,
          padding: const EdgeInsets.symmetric(vertical: 4),
        ),
        child: isLoading
            ? const SizedBox(
          width: 24,
          height: 24,
          child: CircularProgressIndicator(
            color: Colors.black,
            strokeWidth: 2.8,
          ),
        )
            : Text(
          label,
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            letterSpacing: 0.4,
          ),
        ),
      ),
    );
  }
}
