import 'package:bloc/bloc.dart';
import 'package:djangowithflutter/authenticaion/model/login_model/login_model.dart';
import 'package:djangowithflutter/authenticaion/service/signup_service.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'login_event.dart';
part 'login_state.dart';
part 'login_bloc.freezed.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final AuthService loginservice;

  LoginBloc(this.loginservice) : super(const LoginState.initial()) {
    on<LoginEvent>((event, emit) async {
      await event.when(
        started: (username, password) async {
          emit(const LoginState.loading());
          final loginModel =
              await loginservice.login(username: username, password: password);
          if (loginModel != null) {
            emit(LoginState.success(loginModel));
          } else {
            emit(const LoginState.failure("Invalid Credentials"));
          }
        },
      );
    });
  }
}
