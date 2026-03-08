import 'package:flutter/material.dart';
import 'package:heroes_club/OnBoarding/View/HeadOnBoarding.dart';
import 'package:heroes_club/models/models.dart';


class BuildPageOnBoarding extends StatelessWidget {
  const BuildPageOnBoarding({super.key, required this.page});
  final OnboardingModel page;
  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: [
        // الخلفية
        Image.asset(
          page.image,
          fit: BoxFit.cover,
        ),

        Positioned(
          top: 30,           // المسافة من أعلى الشاشة (يمكن تعديلها)
          left: 7,
          right: 1,// المسافة من الجهة اليسرى
          child: HeadOnBoarding(),
        ),
        // Gradient Overlay داكن
        Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Colors.black.withOpacity(0.1),
                Colors.black.withOpacity(0.4),
                Colors.black.withOpacity(0.75),
                Colors.black.withOpacity(0.9),
              ],
              stops: const [0.0, 0.3, 0.6, 1.0],
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 32),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Spacer(flex: 5),

              Text(
                page.title,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 36,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  height: 1.2,
                  shadows: [
                    Shadow(
                      color: Colors.black87,
                      offset: Offset(2, 2),
                      blurRadius: 8,
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 24),

              Text(
                page.subtitle,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 17,
                  color: Colors.white70,
                  height: 1.5,
                ),
              ),
              const Spacer(flex: 2),
            ],
          ),
        ),
      ],
    );
  }
}

