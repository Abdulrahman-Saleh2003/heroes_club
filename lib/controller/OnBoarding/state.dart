
final class OnBoardingState {
  final int currentPage;
  final bool isFinished;
  final bool shouldNavigateToSignUp;   // ← جديد

  const OnBoardingState({
    this.currentPage = 0,
    this.isFinished = false,
    this.shouldNavigateToSignUp = false,
  });

  OnBoardingState copyWith({
    int? currentPage,
    bool? isFinished,
    bool? shouldNavigateToSignUp,
  }) {
    return OnBoardingState(
      currentPage: currentPage ?? this.currentPage,
      isFinished: isFinished ?? this.isFinished,
      shouldNavigateToSignUp: shouldNavigateToSignUp ?? this.shouldNavigateToSignUp,
    );
  }
}