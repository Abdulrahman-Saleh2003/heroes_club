

import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/legacy.dart';
import 'package:heroes_club/controller/OnBoarding/state.dart';
import 'package:heroes_club/data_sources/static/static.dart';
import 'package:heroes_club/screens/Authentication/SignUp/sign_up_screen.dart';
class OnBoardingController extends StateNotifier<OnBoardingState> {
  final Ref ref;
  late PageController pageController;
  Timer? _autoTimer;
  Timer? _resumeTimer;

  bool _isUserInteracting = false;


  OnBoardingController(this.ref)
      : super(const OnBoardingState(currentPage: 0)) {
    pageController = PageController();
    _startAutoSlide();
  }



  void finishOnboarding() {
    state = state.copyWith(isFinished: true);
  }


  void _startAutoSlide() {
    _autoTimer?.cancel();
    _autoTimer = Timer.periodic(const Duration(seconds: 2), (timer) {
      if (_isUserInteracting) return; // توقف إذا المستخدم يتدخل

      if (pageController.hasClients &&
          state.currentPage < onBoardingModel.length - 1) {
        pageController.nextPage(
          duration: const Duration(milliseconds: 800),
          curve: Curves.easeInOut,
        );
      }

      if (state.currentPage >= onBoardingModel.length - 1) {
        _autoTimer?.cancel();
        state = state.copyWith(
          isFinished: true,
          shouldNavigateToSignUp: true,
        );

      }



    });
  }

  void goToSignUp(BuildContext context) {
    Navigator.of(context).pushReplacement(
      _createPageRoute(const SignUpScreen()),
    );
  }

  PageRouteBuilder<T> _createPageRoute<T>(Widget page) {
    return PageRouteBuilder<T>(
      pageBuilder: (context, animation, secondaryAnimation) => page,
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        // نفس المنحنى والمدة التي يستخدمها PageView افتراضياً
        final Animatable<Offset> tween = Tween(
          begin: const Offset(1.0, 0.0),
          end: Offset.zero,
        ).chain(CurveTween(curve: Curves.easeInOut));

        return SlideTransition(
          position: animation.drive(tween),
          child: child,
        );
      },
      transitionDuration: const Duration(milliseconds: 800),
      reverseTransitionDuration: const Duration(milliseconds: 800),
    );
  }
  void onPageChanged(int index) {
    state = state.copyWith(currentPage: index);
    if (!_isUserInteracting) {
      _isUserInteracting = true;
      _resumeTimer?.cancel();
      _resumeTimer = Timer(const Duration(seconds: 2), () {
        _isUserInteracting = false;

      });
    }
  }

  @override
  void dispose() {
    _autoTimer?.cancel();
    _resumeTimer?.cancel();
    pageController.dispose();
    super.dispose();
  }
}