part of 'home_bloc.dart';

@freezed
class HomeEvent with _$HomeEvent {
  const factory HomeEvent.selectScreen(int index) = _SelectScreen;
}
