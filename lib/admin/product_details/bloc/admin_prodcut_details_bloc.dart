import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'admin_prodcut_details_event.dart';
part 'admin_prodcut_details_state.dart';
part 'admin_prodcut_details_bloc.freezed.dart';

class AdminProdcutDetailsBloc
    extends Bloc<AdminProdcutDetailsEvent, AdminProdcutDetailsState> {
  AdminProdcutDetailsBloc() : super(_Initial()) {
    on<AdminProdcutDetailsEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
