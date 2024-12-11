import 'package:bloc/bloc.dart';
import 'package:djangowithflutter/authenticaion/service/signup_service.dart';
import 'package:djangowithflutter/authenticaion/model/signup_model/signup_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'singup_event.dart';
part 'singup_state.dart';
part 'singup_bloc.freezed.dart';

class SingupBloc extends Bloc<SingupEvent, SingupState> {
  final AuthService signupService;

  SingupBloc(this.signupService) : super(const SingupState.initial()) {
    on<SingupEvent>((event, emit) async {
      await event.map(
        // Handle the "started" event
        started: (e) async {
          emit(const SingupState.loading());
          try {
            final signupResult = await signupService.signup(
              email: e.email,
              password: e.password,
              username: e.username,
            );

            if (signupResult != null) {
              emit(SingupState.success(signupResult));
            } else {
              emit(const SingupState.failure(
                  'Signup failed. Please try again.'));
            }
          } catch (e) {
            emit(SingupState.failure('Unexpected error: $e'));
          }
        },
      );
    });
  }
}
