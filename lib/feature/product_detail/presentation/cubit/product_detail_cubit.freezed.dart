// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'product_detail_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$ProductDetailState {
  int get shoeSize => throw _privateConstructorUsedError;
  bool get addedToCart => throw _privateConstructorUsedError;
  int get selectedColor => throw _privateConstructorUsedError;
  int? get quantity => throw _privateConstructorUsedError;
  double? get totalPrice => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ProductDetailStateCopyWith<ProductDetailState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProductDetailStateCopyWith<$Res> {
  factory $ProductDetailStateCopyWith(
          ProductDetailState value, $Res Function(ProductDetailState) then) =
      _$ProductDetailStateCopyWithImpl<$Res, ProductDetailState>;
  @useResult
  $Res call(
      {int shoeSize,
      bool addedToCart,
      int selectedColor,
      int? quantity,
      double? totalPrice});
}

/// @nodoc
class _$ProductDetailStateCopyWithImpl<$Res, $Val extends ProductDetailState>
    implements $ProductDetailStateCopyWith<$Res> {
  _$ProductDetailStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? shoeSize = null,
    Object? addedToCart = null,
    Object? selectedColor = null,
    Object? quantity = freezed,
    Object? totalPrice = freezed,
  }) {
    return _then(_value.copyWith(
      shoeSize: null == shoeSize
          ? _value.shoeSize
          : shoeSize // ignore: cast_nullable_to_non_nullable
              as int,
      addedToCart: null == addedToCart
          ? _value.addedToCart
          : addedToCart // ignore: cast_nullable_to_non_nullable
              as bool,
      selectedColor: null == selectedColor
          ? _value.selectedColor
          : selectedColor // ignore: cast_nullable_to_non_nullable
              as int,
      quantity: freezed == quantity
          ? _value.quantity
          : quantity // ignore: cast_nullable_to_non_nullable
              as int?,
      totalPrice: freezed == totalPrice
          ? _value.totalPrice
          : totalPrice // ignore: cast_nullable_to_non_nullable
              as double?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ProductDetailStateImplCopyWith<$Res>
    implements $ProductDetailStateCopyWith<$Res> {
  factory _$$ProductDetailStateImplCopyWith(_$ProductDetailStateImpl value,
          $Res Function(_$ProductDetailStateImpl) then) =
      __$$ProductDetailStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int shoeSize,
      bool addedToCart,
      int selectedColor,
      int? quantity,
      double? totalPrice});
}

/// @nodoc
class __$$ProductDetailStateImplCopyWithImpl<$Res>
    extends _$ProductDetailStateCopyWithImpl<$Res, _$ProductDetailStateImpl>
    implements _$$ProductDetailStateImplCopyWith<$Res> {
  __$$ProductDetailStateImplCopyWithImpl(_$ProductDetailStateImpl _value,
      $Res Function(_$ProductDetailStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? shoeSize = null,
    Object? addedToCart = null,
    Object? selectedColor = null,
    Object? quantity = freezed,
    Object? totalPrice = freezed,
  }) {
    return _then(_$ProductDetailStateImpl(
      shoeSize: null == shoeSize
          ? _value.shoeSize
          : shoeSize // ignore: cast_nullable_to_non_nullable
              as int,
      addedToCart: null == addedToCart
          ? _value.addedToCart
          : addedToCart // ignore: cast_nullable_to_non_nullable
              as bool,
      selectedColor: null == selectedColor
          ? _value.selectedColor
          : selectedColor // ignore: cast_nullable_to_non_nullable
              as int,
      quantity: freezed == quantity
          ? _value.quantity
          : quantity // ignore: cast_nullable_to_non_nullable
              as int?,
      totalPrice: freezed == totalPrice
          ? _value.totalPrice
          : totalPrice // ignore: cast_nullable_to_non_nullable
              as double?,
    ));
  }
}

/// @nodoc

class _$ProductDetailStateImpl extends _ProductDetailState {
  const _$ProductDetailStateImpl(
      {this.shoeSize = 0,
      this.addedToCart = false,
      this.selectedColor = 1,
      this.quantity = 1,
      this.totalPrice = 0.0})
      : super._();

  @override
  @JsonKey()
  final int shoeSize;
  @override
  @JsonKey()
  final bool addedToCart;
  @override
  @JsonKey()
  final int selectedColor;
  @override
  @JsonKey()
  final int? quantity;
  @override
  @JsonKey()
  final double? totalPrice;

  @override
  String toString() {
    return 'ProductDetailState(shoeSize: $shoeSize, addedToCart: $addedToCart, selectedColor: $selectedColor, quantity: $quantity, totalPrice: $totalPrice)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ProductDetailStateImpl &&
            (identical(other.shoeSize, shoeSize) ||
                other.shoeSize == shoeSize) &&
            (identical(other.addedToCart, addedToCart) ||
                other.addedToCart == addedToCart) &&
            (identical(other.selectedColor, selectedColor) ||
                other.selectedColor == selectedColor) &&
            (identical(other.quantity, quantity) ||
                other.quantity == quantity) &&
            (identical(other.totalPrice, totalPrice) ||
                other.totalPrice == totalPrice));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, shoeSize, addedToCart, selectedColor, quantity, totalPrice);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ProductDetailStateImplCopyWith<_$ProductDetailStateImpl> get copyWith =>
      __$$ProductDetailStateImplCopyWithImpl<_$ProductDetailStateImpl>(
          this, _$identity);
}

abstract class _ProductDetailState extends ProductDetailState {
  const factory _ProductDetailState(
      {final int shoeSize,
      final bool addedToCart,
      final int selectedColor,
      final int? quantity,
      final double? totalPrice}) = _$ProductDetailStateImpl;
  const _ProductDetailState._() : super._();

  @override
  int get shoeSize;
  @override
  bool get addedToCart;
  @override
  int get selectedColor;
  @override
  int? get quantity;
  @override
  double? get totalPrice;
  @override
  @JsonKey(ignore: true)
  _$$ProductDetailStateImplCopyWith<_$ProductDetailStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
