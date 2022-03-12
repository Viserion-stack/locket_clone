part of 'feedback_bloc.dart';

@freezed
class FeedbackState with _$FeedbackState {
  const factory FeedbackState({
    required String message,
    required String email,
    required String firsName,
    required bool isValid,
  }) = _FeedbackState;

  factory FeedbackState.initial() => const FeedbackState(
        email: '',
        firsName: '',
        message: '',
        isValid: false,
      );
}
