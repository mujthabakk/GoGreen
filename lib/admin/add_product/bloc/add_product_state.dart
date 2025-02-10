part of 'add_product_bloc.dart';

@freezed
class AddProductState with _$AddProductState {
  const factory AddProductState({
    required File? selectedImage,
    required bool isSubmitting,
    required String errorMessage,
    required String successMessage,
  }) = _AddProductState;

  factory AddProductState.initial() => const AddProductState(
        selectedImage: null,
        isSubmitting: false,
        errorMessage: "",
        successMessage: "",
      );
}
