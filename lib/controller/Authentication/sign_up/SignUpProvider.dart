import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:heroes_club/controller/Authentication/sign_up/signup_controller.dart';
import 'package:heroes_club/controller/Authentication/sign_up/signup_state.dart';

final signUpControllerProvider =
NotifierProvider<SignUpController, SignUpState>(
  SignUpController.new,
);