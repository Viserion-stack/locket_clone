part of 'login_bloc.dart';

@freezed
class LoginState with _$LoginState {
  const factory LoginState({
    required bool isAuthenticated,
  }) = _LoginState;
  factory LoginState.initial() => const LoginState(isAuthenticated: false);
}
