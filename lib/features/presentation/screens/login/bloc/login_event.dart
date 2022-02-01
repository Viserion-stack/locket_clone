part of 'login_bloc.dart';

@freezed
class LoginEvent with _$LoginEvent {
  const factory LoginEvent.loginSubmit(String email, String password) =
      _LoginSubmit;
}
