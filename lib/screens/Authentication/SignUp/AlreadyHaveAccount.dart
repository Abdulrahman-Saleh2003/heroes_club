import 'package:flutter/material.dart';

class AlreadyHaveAccount extends StatelessWidget {
  final VoidCallback onTap;
  final String label1;
  final String label2;


  const AlreadyHaveAccount({super.key, required this.onTap, this.label1='لديك حساب بالفعل؟ ', this.label2='تسجيل الدخول'});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: RichText(
        text:  TextSpan(
          children: [
            TextSpan(
              text:label1 ,
              style: TextStyle(color: Colors.white70),
            ),
            TextSpan(
              text: label2,
              style: TextStyle(
                color: Color(0xFFFFD700),
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}