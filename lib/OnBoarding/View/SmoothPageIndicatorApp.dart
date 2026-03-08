import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:heroes_club/data_sources/static/static.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart'; // أضف هذا الـ package
import 'package:heroes_club/core/constant/AppColor.dart';

class SmoothPageIndicatorApp extends StatelessWidget {
  const SmoothPageIndicatorApp({super.key, required this.pageController, required this.currentPage});
  final PageController pageController;
  final   int currentPage ;


  @override
  Widget build(BuildContext context) {
    return           Positioned(
      bottom: 0,
      left: 0,
      right: 0,
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(24, 0, 24, 32),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              // Page Indicator
              SmoothPageIndicator(
                controller: pageController,
                count: onBoardingModel.length,
                effect: const ExpandingDotsEffect(
                  dotHeight: 8,
                  dotWidth: 8,
                  spacing: 12,
                  activeDotColor:AppMyColor.yellowApp, // أصفر
                  dotColor: AppMyColor.white24App,
                ),
              ),

              const SizedBox(height: 32),

              // زر التالي / ابدأ الآن
              SizedBox(
                width: double.infinity,
                height: 56,
                child: ElevatedButton(
                  onPressed: () {
                    if (currentPage < onBoardingModel.length - 1) {
                      pageController.nextPage(
                        duration: const Duration(milliseconds: 600),
                        curve: Curves.easeInOut,
                      );
                    } else {

                    }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppMyColor.yellowApp,
                    foregroundColor: AppMyColor.black87App,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    elevation: 0,
                  ),
                  child: Text(
                    currentPage < onBoardingModel.length - 1
                        ? "التالي ➜"
                        : "ابدأ الآن",
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
