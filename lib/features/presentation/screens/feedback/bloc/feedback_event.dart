part of 'feedback_bloc.dart';

@freezed
class FeedbackEvent with _$FeedbackEvent {
  const factory FeedbackEvent.setEmal(String email) = _SetEmail;
  const factory FeedbackEvent.setMessage(String message) = _SetMessage;
  const factory FeedbackEvent.setFirstName(String firstName) = _FirstName;
  const factory FeedbackEvent.isValid(bool isValid) = _IsValid;
}
