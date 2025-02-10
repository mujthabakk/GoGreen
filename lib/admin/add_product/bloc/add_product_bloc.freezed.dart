// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'add_product_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$AddProductEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() selectImage,
    required TResult Function(
            String name,
            String price,
            String quantity,
            String category,
            String description,
            String about,
            String careTips,
            String sellerName,
            String sellerContact,
            String offer,
            File image)
        submitProduct,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? selectImage,
    TResult? Function(
            String name,
            String price,
            String quantity,
            String category,
            String description,
            String about,
            String careTips,
            String sellerName,
            String sellerContact,
            String offer,
            File image)?
        submitProduct,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? selectImage,
    TResult Function(
            String name,
            String price,
            String quantity,
            String category,
            String description,
            String about,
            String careTips,
            String sellerName,
            String sellerContact,
            String offer,
            File image)?
        submitProduct,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(SelectImageEvent value) selectImage,
    required TResult Function(SubmitProductEvent value) submitProduct,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(SelectImageEvent value)? selectImage,
    TResult? Function(SubmitProductEvent value)? submitProduct,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(SelectImageEvent value)? selectImage,
    TResult Function(SubmitProductEvent value)? submitProduct,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AddProductEventCopyWith<$Res> {
  factory $AddProductEventCopyWith(
          AddProductEvent value, $Res Function(AddProductEvent) then) =
      _$AddProductEventCopyWithImpl<$Res, AddProductEvent>;
}

/// @nodoc
class _$AddProductEventCopyWithImpl<$Res, $Val extends AddProductEvent>
    implements $AddProductEventCopyWith<$Res> {
  _$AddProductEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AddProductEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$SelectImageEventImplCopyWith<$Res> {
  factory _$$SelectImageEventImplCopyWith(_$SelectImageEventImpl value,
          $Res Function(_$SelectImageEventImpl) then) =
      __$$SelectImageEventImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$SelectImageEventImplCopyWithImpl<$Res>
    extends _$AddProductEventCopyWithImpl<$Res, _$SelectImageEventImpl>
    implements _$$SelectImageEventImplCopyWith<$Res> {
  __$$SelectImageEventImplCopyWithImpl(_$SelectImageEventImpl _value,
      $Res Function(_$SelectImageEventImpl) _then)
      : super(_value, _then);

  /// Create a copy of AddProductEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$SelectImageEventImpl implements SelectImageEvent {
  const _$SelectImageEventImpl();

  @override
  String toString() {
    return 'AddProductEvent.selectImage()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$SelectImageEventImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() selectImage,
    required TResult Function(
            String name,
            String price,
            String quantity,
            String category,
            String description,
            String about,
            String careTips,
            String sellerName,
            String sellerContact,
            String offer,
            File image)
        submitProduct,
  }) {
    return selectImage();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? selectImage,
    TResult? Function(
            String name,
            String price,
            String quantity,
            String category,
            String description,
            String about,
            String careTips,
            String sellerName,
            String sellerContact,
            String offer,
            File image)?
        submitProduct,
  }) {
    return selectImage?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? selectImage,
    TResult Function(
            String name,
            String price,
            String quantity,
            String category,
            String description,
            String about,
            String careTips,
            String sellerName,
            String sellerContact,
            String offer,
            File image)?
        submitProduct,
    required TResult orElse(),
  }) {
    if (selectImage != null) {
      return selectImage();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(SelectImageEvent value) selectImage,
    required TResult Function(SubmitProductEvent value) submitProduct,
  }) {
    return selectImage(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(SelectImageEvent value)? selectImage,
    TResult? Function(SubmitProductEvent value)? submitProduct,
  }) {
    return selectImage?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(SelectImageEvent value)? selectImage,
    TResult Function(SubmitProductEvent value)? submitProduct,
    required TResult orElse(),
  }) {
    if (selectImage != null) {
      return selectImage(this);
    }
    return orElse();
  }
}

abstract class SelectImageEvent implements AddProductEvent {
  const factory SelectImageEvent() = _$SelectImageEventImpl;
}

/// @nodoc
abstract class _$$SubmitProductEventImplCopyWith<$Res> {
  factory _$$SubmitProductEventImplCopyWith(_$SubmitProductEventImpl value,
          $Res Function(_$SubmitProductEventImpl) then) =
      __$$SubmitProductEventImplCopyWithImpl<$Res>;
  @useResult
  $Res call(
      {String name,
      String price,
      String quantity,
      String category,
      String description,
      String about,
      String careTips,
      String sellerName,
      String sellerContact,
      String offer,
      File image});
}

/// @nodoc
class __$$SubmitProductEventImplCopyWithImpl<$Res>
    extends _$AddProductEventCopyWithImpl<$Res, _$SubmitProductEventImpl>
    implements _$$SubmitProductEventImplCopyWith<$Res> {
  __$$SubmitProductEventImplCopyWithImpl(_$SubmitProductEventImpl _value,
      $Res Function(_$SubmitProductEventImpl) _then)
      : super(_value, _then);

  /// Create a copy of AddProductEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? price = null,
    Object? quantity = null,
    Object? category = null,
    Object? description = null,
    Object? about = null,
    Object? careTips = null,
    Object? sellerName = null,
    Object? sellerContact = null,
    Object? offer = null,
    Object? image = null,
  }) {
    return _then(_$SubmitProductEventImpl(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      price: null == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as String,
      quantity: null == quantity
          ? _value.quantity
          : quantity // ignore: cast_nullable_to_non_nullable
              as String,
      category: null == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      about: null == about
          ? _value.about
          : about // ignore: cast_nullable_to_non_nullable
              as String,
      careTips: null == careTips
          ? _value.careTips
          : careTips // ignore: cast_nullable_to_non_nullable
              as String,
      sellerName: null == sellerName
          ? _value.sellerName
          : sellerName // ignore: cast_nullable_to_non_nullable
              as String,
      sellerContact: null == sellerContact
          ? _value.sellerContact
          : sellerContact // ignore: cast_nullable_to_non_nullable
              as String,
      offer: null == offer
          ? _value.offer
          : offer // ignore: cast_nullable_to_non_nullable
              as String,
      image: null == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as File,
    ));
  }
}

/// @nodoc

class _$SubmitProductEventImpl implements SubmitProductEvent {
  const _$SubmitProductEventImpl(
      {required this.name,
      required this.price,
      required this.quantity,
      required this.category,
      required this.description,
      required this.about,
      required this.careTips,
      required this.sellerName,
      required this.sellerContact,
      required this.offer,
      required this.image});

  @override
  final String name;
  @override
  final String price;
  @override
  final String quantity;
  @override
  final String category;
  @override
  final String description;
  @override
  final String about;
  @override
  final String careTips;
  @override
  final String sellerName;
  @override
  final String sellerContact;
  @override
  final String offer;
  @override
  final File image;

  @override
  String toString() {
    return 'AddProductEvent.submitProduct(name: $name, price: $price, quantity: $quantity, category: $category, description: $description, about: $about, careTips: $careTips, sellerName: $sellerName, sellerContact: $sellerContact, offer: $offer, image: $image)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SubmitProductEventImpl &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.price, price) || other.price == price) &&
            (identical(other.quantity, quantity) ||
                other.quantity == quantity) &&
            (identical(other.category, category) ||
                other.category == category) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.about, about) || other.about == about) &&
            (identical(other.careTips, careTips) ||
                other.careTips == careTips) &&
            (identical(other.sellerName, sellerName) ||
                other.sellerName == sellerName) &&
            (identical(other.sellerContact, sellerContact) ||
                other.sellerContact == sellerContact) &&
            (identical(other.offer, offer) || other.offer == offer) &&
            (identical(other.image, image) || other.image == image));
  }

  @override
  int get hashCode => Object.hash(runtimeType, name, price, quantity, category,
      description, about, careTips, sellerName, sellerContact, offer, image);

  /// Create a copy of AddProductEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SubmitProductEventImplCopyWith<_$SubmitProductEventImpl> get copyWith =>
      __$$SubmitProductEventImplCopyWithImpl<_$SubmitProductEventImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() selectImage,
    required TResult Function(
            String name,
            String price,
            String quantity,
            String category,
            String description,
            String about,
            String careTips,
            String sellerName,
            String sellerContact,
            String offer,
            File image)
        submitProduct,
  }) {
    return submitProduct(name, price, quantity, category, description, about,
        careTips, sellerName, sellerContact, offer, image);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? selectImage,
    TResult? Function(
            String name,
            String price,
            String quantity,
            String category,
            String description,
            String about,
            String careTips,
            String sellerName,
            String sellerContact,
            String offer,
            File image)?
        submitProduct,
  }) {
    return submitProduct?.call(name, price, quantity, category, description,
        about, careTips, sellerName, sellerContact, offer, image);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? selectImage,
    TResult Function(
            String name,
            String price,
            String quantity,
            String category,
            String description,
            String about,
            String careTips,
            String sellerName,
            String sellerContact,
            String offer,
            File image)?
        submitProduct,
    required TResult orElse(),
  }) {
    if (submitProduct != null) {
      return submitProduct(name, price, quantity, category, description, about,
          careTips, sellerName, sellerContact, offer, image);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(SelectImageEvent value) selectImage,
    required TResult Function(SubmitProductEvent value) submitProduct,
  }) {
    return submitProduct(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(SelectImageEvent value)? selectImage,
    TResult? Function(SubmitProductEvent value)? submitProduct,
  }) {
    return submitProduct?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(SelectImageEvent value)? selectImage,
    TResult Function(SubmitProductEvent value)? submitProduct,
    required TResult orElse(),
  }) {
    if (submitProduct != null) {
      return submitProduct(this);
    }
    return orElse();
  }
}

abstract class SubmitProductEvent implements AddProductEvent {
  const factory SubmitProductEvent(
      {required final String name,
      required final String price,
      required final String quantity,
      required final String category,
      required final String description,
      required final String about,
      required final String careTips,
      required final String sellerName,
      required final String sellerContact,
      required final String offer,
      required final File image}) = _$SubmitProductEventImpl;

  String get name;
  String get price;
  String get quantity;
  String get category;
  String get description;
  String get about;
  String get careTips;
  String get sellerName;
  String get sellerContact;
  String get offer;
  File get image;

  /// Create a copy of AddProductEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SubmitProductEventImplCopyWith<_$SubmitProductEventImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$AddProductState {
  File? get selectedImage => throw _privateConstructorUsedError;
  bool get isSubmitting => throw _privateConstructorUsedError;
  String get errorMessage => throw _privateConstructorUsedError;
  String get successMessage => throw _privateConstructorUsedError;

  /// Create a copy of AddProductState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AddProductStateCopyWith<AddProductState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AddProductStateCopyWith<$Res> {
  factory $AddProductStateCopyWith(
          AddProductState value, $Res Function(AddProductState) then) =
      _$AddProductStateCopyWithImpl<$Res, AddProductState>;
  @useResult
  $Res call(
      {File? selectedImage,
      bool isSubmitting,
      String errorMessage,
      String successMessage});
}

/// @nodoc
class _$AddProductStateCopyWithImpl<$Res, $Val extends AddProductState>
    implements $AddProductStateCopyWith<$Res> {
  _$AddProductStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AddProductState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? selectedImage = freezed,
    Object? isSubmitting = null,
    Object? errorMessage = null,
    Object? successMessage = null,
  }) {
    return _then(_value.copyWith(
      selectedImage: freezed == selectedImage
          ? _value.selectedImage
          : selectedImage // ignore: cast_nullable_to_non_nullable
              as File?,
      isSubmitting: null == isSubmitting
          ? _value.isSubmitting
          : isSubmitting // ignore: cast_nullable_to_non_nullable
              as bool,
      errorMessage: null == errorMessage
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String,
      successMessage: null == successMessage
          ? _value.successMessage
          : successMessage // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AddProductStateImplCopyWith<$Res>
    implements $AddProductStateCopyWith<$Res> {
  factory _$$AddProductStateImplCopyWith(_$AddProductStateImpl value,
          $Res Function(_$AddProductStateImpl) then) =
      __$$AddProductStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {File? selectedImage,
      bool isSubmitting,
      String errorMessage,
      String successMessage});
}

/// @nodoc
class __$$AddProductStateImplCopyWithImpl<$Res>
    extends _$AddProductStateCopyWithImpl<$Res, _$AddProductStateImpl>
    implements _$$AddProductStateImplCopyWith<$Res> {
  __$$AddProductStateImplCopyWithImpl(
      _$AddProductStateImpl _value, $Res Function(_$AddProductStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of AddProductState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? selectedImage = freezed,
    Object? isSubmitting = null,
    Object? errorMessage = null,
    Object? successMessage = null,
  }) {
    return _then(_$AddProductStateImpl(
      selectedImage: freezed == selectedImage
          ? _value.selectedImage
          : selectedImage // ignore: cast_nullable_to_non_nullable
              as File?,
      isSubmitting: null == isSubmitting
          ? _value.isSubmitting
          : isSubmitting // ignore: cast_nullable_to_non_nullable
              as bool,
      errorMessage: null == errorMessage
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String,
      successMessage: null == successMessage
          ? _value.successMessage
          : successMessage // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$AddProductStateImpl implements _AddProductState {
  const _$AddProductStateImpl(
      {required this.selectedImage,
      required this.isSubmitting,
      required this.errorMessage,
      required this.successMessage});

  @override
  final File? selectedImage;
  @override
  final bool isSubmitting;
  @override
  final String errorMessage;
  @override
  final String successMessage;

  @override
  String toString() {
    return 'AddProductState(selectedImage: $selectedImage, isSubmitting: $isSubmitting, errorMessage: $errorMessage, successMessage: $successMessage)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AddProductStateImpl &&
            (identical(other.selectedImage, selectedImage) ||
                other.selectedImage == selectedImage) &&
            (identical(other.isSubmitting, isSubmitting) ||
                other.isSubmitting == isSubmitting) &&
            (identical(other.errorMessage, errorMessage) ||
                other.errorMessage == errorMessage) &&
            (identical(other.successMessage, successMessage) ||
                other.successMessage == successMessage));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, selectedImage, isSubmitting, errorMessage, successMessage);

  /// Create a copy of AddProductState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AddProductStateImplCopyWith<_$AddProductStateImpl> get copyWith =>
      __$$AddProductStateImplCopyWithImpl<_$AddProductStateImpl>(
          this, _$identity);
}

abstract class _AddProductState implements AddProductState {
  const factory _AddProductState(
      {required final File? selectedImage,
      required final bool isSubmitting,
      required final String errorMessage,
      required final String successMessage}) = _$AddProductStateImpl;

  @override
  File? get selectedImage;
  @override
  bool get isSubmitting;
  @override
  String get errorMessage;
  @override
  String get successMessage;

  /// Create a copy of AddProductState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AddProductStateImplCopyWith<_$AddProductStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
