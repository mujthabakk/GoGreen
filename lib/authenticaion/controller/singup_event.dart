part of 'singup_bloc.dart';

@freezed
class SingupEvent with _$SingupEvent {
  const factory SingupEvent.started({
    required String email,
    required String password,
    required String username,
  }) = _Started;
}
