part of 'singup_bloc.dart';

@freezed
class SingupState with _$SingupState {
  const factory SingupState.initial() = _Initial;
  const factory SingupState.loading() = _Loading;
  const factory SingupState.success(SignupModel signupModel) = _Success;
  const factory SingupState.failure(String message) = _Failure;
}
