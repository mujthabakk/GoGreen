part of 'login_bloc.dart';

@freezed
class LoginEvent with _$LoginEvent {
  const factory LoginEvent.started({
    required String password,
    required String username,
  }) = _Started;
}
