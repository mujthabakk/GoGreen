part of 'add_product_bloc.dart';

@freezed
class AddProductEvent with _$AddProductEvent {
  const factory AddProductEvent.selectImage() = SelectImageEvent;
  const factory AddProductEvent.submitProduct({
    required String name,
    required String price,
    required String quantity,
    required String category,
    required String description,
    required String about,
    required String careTips,
    required String sellerName,
    required String sellerContact,
    required String offer,
    required File image,
  }) = SubmitProductEvent;
}
