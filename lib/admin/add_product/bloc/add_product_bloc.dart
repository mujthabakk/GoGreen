import 'dart:io';
import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:image_picker/image_picker.dart';

part 'add_product_event.dart';
part 'add_product_state.dart';
part 'add_product_bloc.freezed.dart';

class AddProductBloc extends Bloc<AddProductEvent, AddProductState> {
  AddProductBloc() : super(AddProductState.initial()) {
    on<SelectImageEvent>(_onSelectImage);
    on<SubmitProductEvent>(_onSubmitProduct);
  }

  Future<void> _onSelectImage(
      SelectImageEvent event, Emitter<AddProductState> emit) async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      emit(state.copyWith(selectedImage: File(pickedFile.path)));
    }
  }

  void _onSubmitProduct(
      SubmitProductEvent event, Emitter<AddProductState> emit) {
    if (event.name.isEmpty ||
        event.price.isEmpty ||
        event.quantity.isEmpty ||
        event.category.isEmpty ||
        event.description.isEmpty ||
        event.about.isEmpty ||
        event.careTips.isEmpty ||
        event.sellerName.isEmpty ||
        event.sellerContact.isEmpty ||
        state.selectedImage == null) {
      emit(state.copyWith(
          isSubmitting: false, errorMessage: "All fields are required"));
      return;
    }

    emit(state.copyWith(isSubmitting: true, errorMessage: ""));

    final productData = {
      "name": event.name,
      "price": event.price,
      "quantity": event.quantity,
      "category": event.category,
      "description": event.description,
      "about": event.about,
      "careTips": event.careTips,
      "sellerName": event.sellerName,
      "sellerContact": event.sellerContact,
      "image": state.selectedImage!.path,
    };

    print("Product Data: $productData");

    emit(state.copyWith(
        isSubmitting: false, successMessage: "Product Added Successfully"));
  }
}
