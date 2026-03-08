
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:heroes_club/OnBoarding/View/BuildPageOnBoarding.dart';
import 'package:heroes_club/OnBoarding/View/SmoothPageIndicatorApp.dart';
import 'package:heroes_club/controller/OnBoarding/onboarding_provider.dart';
import 'package:heroes_club/controller/OnBoarding/state.dart';
import 'package:heroes_club/data_sources/static/static.dart';
import 'package:heroes_club/screens/Authentication/SignUp/sign_up_screen.dart';

class OnboardingScreen extends ConsumerWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    final state = ref.watch(onBoardingControllerProvider);
    final controller = ref.read(onBoardingControllerProvider.notifier);


    ref.listen(onBoardingControllerProvider, (previous, next) {
      if (next.shouldNavigateToSignUp && previous?.shouldNavigateToSignUp != true) {
        WidgetsBinding.instance.addPostFrameCallback((_) {
          if (context.mounted) {
            ref.read(onBoardingControllerProvider.notifier).goToSignUp(context);
          }
        });
      }
    });

    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [

            PageView.builder(
              controller: controller.pageController,
              itemCount: onBoardingModel.length,
              onPageChanged: controller.onPageChanged,
              itemBuilder: (context, index) {

                final page = onBoardingModel[index];

                return BuildPageOnBoarding(
                  page: page,
                );
              },
            ),

            SmoothPageIndicatorApp(
              currentPage: state.currentPage,
              pageController: controller.pageController,
            )

          ],
        ),
      ),
    );
  }
}