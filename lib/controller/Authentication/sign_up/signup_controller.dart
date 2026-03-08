

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:heroes_club/controller/Authentication/sign_up/signup_state.dart';

class SignUpController extends Notifier<SignUpState> {

  @override
  SignUpState build() {
    return const SignUpState();
  }

  void updateName(String value) =>
      state = state.copyWith(name: value.trim());

  void updateAge(String value) =>
      state = state.copyWith(age: value.trim());

  void updateWeight(String value) =>
      state = state.copyWith(weight: value.trim());

  void updatePhone(String value) =>
      state = state.copyWith(phone: value.trim());

  void updatePassword(String value) =>
      state = state.copyWith(password: value);

  void updateConfirmPassword(String value) =>
      state = state.copyWith(confirmPassword: value);

  void toggleTerms(bool? value) =>
      state = state.copyWith(isTermsAccepted: value ?? false);

  Future<void> signUp() async {

    if (!state.isFormValid) return;

    state = state.copyWith(
      status: SignUpStatus.loading,
      errorMessage: null,
    );

    try {

      /// هنا لاحقاً تضع API

      await Future.delayed(const Duration(seconds: 2));

      state = state.copyWith(status: SignUpStatus.success);

    } catch (e) {

      state = state.copyWith(
        status: SignUpStatus.error,
        errorMessage: e.toString().replaceFirst('Exception: ', ''),
      );

    }
  }

  void reset() {
    state = const SignUpState();
  }
}

// final signUpControllerProvider = StateNotifierProvider.autoDispose<
//     SignUpController, SignUpState>(
//       (ref) => SignUpController(),
// );
