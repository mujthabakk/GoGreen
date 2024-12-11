import 'package:freezed_annotation/freezed_annotation.dart';

part 'signup_model.freezed.dart';
part 'signup_model.g.dart';

@freezed
class SignupModel with _$SignupModel {
  factory SignupModel({
    String? username,
    String? email,
    String? password,
  }) = _SignupModel;

  factory SignupModel.fromJson(Map<String, dynamic> json) =>
      _$SignupModelFromJson(json);
}
