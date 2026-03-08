// lib/features/auth/signup/signup_state.dart
enum SignUpStatus { initial, loading, success, error }

class SignUpState {
  final SignUpStatus status;
  final String? errorMessage;
  final bool isTermsAccepted;

  final String name;
  final String age;
  final String weight;
  final String phone;
  final String password;
  final String confirmPassword;

  const SignUpState({
    this.status = SignUpStatus.initial,
    this.errorMessage,
    this.isTermsAccepted = false,
    this.name = '',
    this.age = '',
    this.weight = '',
    this.phone = '',
    this.password = '',
    this.confirmPassword = '',
  });

  SignUpState copyWith({
    SignUpStatus? status,
    String? errorMessage,
    bool? isTermsAccepted,
    String? name,
    String? age,
    String? weight,
    String? phone,
    String? password,
    String? confirmPassword,
  }) {
    return SignUpState(
      status: status ?? this.status,
      errorMessage: errorMessage ?? this.errorMessage,
      isTermsAccepted: isTermsAccepted ?? this.isTermsAccepted,
      name: name ?? this.name,
      age: age ?? this.age,
      weight: weight ?? this.weight,
      phone: phone ?? this.phone,
      password: password ?? this.password,
      confirmPassword: confirmPassword ?? this.confirmPassword,
    );
  }

  bool get isFormValid =>
      name.trim().isNotEmpty &&
          age.trim().isNotEmpty &&
          weight.trim().isNotEmpty &&
          phone.trim().length >= 9 &&
          password.length >= 6 &&
          password == confirmPassword &&
          isTermsAccepted;
}