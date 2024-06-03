// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'product_review_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$ProductReviewState {
  dynamic get selectedCategoryIndex => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ProductReviewStateCopyWith<ProductReviewState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProductReviewStateCopyWith<$Res> {
  factory $ProductReviewStateCopyWith(
          ProductReviewState value, $Res Function(ProductReviewState) then) =
      _$ProductReviewStateCopyWithImpl<$Res, ProductReviewState>;
  @useResult
  $Res call({dynamic selectedCategoryIndex});
}

/// @nodoc
class _$ProductReviewStateCopyWithImpl<$Res, $Val extends ProductReviewState>
    implements $ProductReviewStateCopyWith<$Res> {
  _$ProductReviewStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? selectedCategoryIndex = freezed,
  }) {
    return _then(_value.copyWith(
      selectedCategoryIndex: freezed == selectedCategoryIndex
          ? _value.selectedCategoryIndex
          : selectedCategoryIndex // ignore: cast_nullable_to_non_nullable
              as dynamic,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ProductReviewStateImplCopyWith<$Res>
    implements $ProductReviewStateCopyWith<$Res> {
  factory _$$ProductReviewStateImplCopyWith(_$ProductReviewStateImpl value,
          $Res Function(_$ProductReviewStateImpl) then) =
      __$$ProductReviewStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({dynamic selectedCategoryIndex});
}

/// @nodoc
class __$$ProductReviewStateImplCopyWithImpl<$Res>
    extends _$ProductReviewStateCopyWithImpl<$Res, _$ProductReviewStateImpl>
    implements _$$ProductReviewStateImplCopyWith<$Res> {
  __$$ProductReviewStateImplCopyWithImpl(_$ProductReviewStateImpl _value,
      $Res Function(_$ProductReviewStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? selectedCategoryIndex = freezed,
  }) {
    return _then(_$ProductReviewStateImpl(
      selectedCategoryIndex: freezed == selectedCategoryIndex
          ? _value.selectedCategoryIndex!
          : selectedCategoryIndex,
    ));
  }
}

/// @nodoc

class _$ProductReviewStateImpl extends _ProductReviewState {
  const _$ProductReviewStateImpl({this.selectedCategoryIndex = 0}) : super._();

  @override
  @JsonKey()
  final dynamic selectedCategoryIndex;

  @override
  String toString() {
    return 'ProductReviewState(selectedCategoryIndex: $selectedCategoryIndex)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ProductReviewStateImpl &&
            const DeepCollectionEquality()
                .equals(other.selectedCategoryIndex, selectedCategoryIndex));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(selectedCategoryIndex));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ProductReviewStateImplCopyWith<_$ProductReviewStateImpl> get copyWith =>
      __$$ProductReviewStateImplCopyWithImpl<_$ProductReviewStateImpl>(
          this, _$identity);
}

abstract class _ProductReviewState extends ProductReviewState {
  const factory _ProductReviewState({final dynamic selectedCategoryIndex}) =
      _$ProductReviewStateImpl;
  const _ProductReviewState._() : super._();

  @override
  dynamic get selectedCategoryIndex;
  @override
  @JsonKey(ignore: true)
  _$$ProductReviewStateImplCopyWith<_$ProductReviewStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
