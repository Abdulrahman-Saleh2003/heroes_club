import 'package:flutter_riverpod/legacy.dart';
import 'package:heroes_club/controller/OnBoarding/OnBoardingController.dart';
import 'package:heroes_club/controller/OnBoarding/state.dart';


final onBoardingControllerProvider =
StateNotifierProvider<OnBoardingController, OnBoardingState>((ref) {
  return OnBoardingController(ref);
});