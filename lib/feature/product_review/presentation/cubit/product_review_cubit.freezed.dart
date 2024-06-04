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
  List<Review>? get reviewList => throw _privateConstructorUsedError;
  List<String>? get reviewCategoryList => throw _privateConstructorUsedError;

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
  $Res call(
      {dynamic selectedCategoryIndex,
      List<Review>? reviewList,
      List<String>? reviewCategoryList});
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
    Object? reviewList = freezed,
    Object? reviewCategoryList = freezed,
  }) {
    return _then(_value.copyWith(
      selectedCategoryIndex: freezed == selectedCategoryIndex
          ? _value.selectedCategoryIndex
          : selectedCategoryIndex // ignore: cast_nullable_to_non_nullable
              as dynamic,
      reviewList: freezed == reviewList
          ? _value.reviewList
          : reviewList // ignore: cast_nullable_to_non_nullable
              as List<Review>?,
      reviewCategoryList: freezed == reviewCategoryList
          ? _value.reviewCategoryList
          : reviewCategoryList // ignore: cast_nullable_to_non_nullable
              as List<String>?,
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
  $Res call(
      {dynamic selectedCategoryIndex,
      List<Review>? reviewList,
      List<String>? reviewCategoryList});
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
    Object? reviewList = freezed,
    Object? reviewCategoryList = freezed,
  }) {
    return _then(_$ProductReviewStateImpl(
      selectedCategoryIndex: freezed == selectedCategoryIndex
          ? _value.selectedCategoryIndex!
          : selectedCategoryIndex,
      reviewList: freezed == reviewList
          ? _value._reviewList
          : reviewList // ignore: cast_nullable_to_non_nullable
              as List<Review>?,
      reviewCategoryList: freezed == reviewCategoryList
          ? _value._reviewCategoryList
          : reviewCategoryList // ignore: cast_nullable_to_non_nullable
              as List<String>?,
    ));
  }
}

/// @nodoc

class _$ProductReviewStateImpl extends _ProductReviewState {
  const _$ProductReviewStateImpl(
      {this.selectedCategoryIndex = 0,
      final List<Review>? reviewList,
      final List<String>? reviewCategoryList})
      : _reviewList = reviewList,
        _reviewCategoryList = reviewCategoryList,
        super._();

  @override
  @JsonKey()
  final dynamic selectedCategoryIndex;
  final List<Review>? _reviewList;
  @override
  List<Review>? get reviewList {
    final value = _reviewList;
    if (value == null) return null;
    if (_reviewList is EqualUnmodifiableListView) return _reviewList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<String>? _reviewCategoryList;
  @override
  List<String>? get reviewCategoryList {
    final value = _reviewCategoryList;
    if (value == null) return null;
    if (_reviewCategoryList is EqualUnmodifiableListView)
      return _reviewCategoryList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'ProductReviewState(selectedCategoryIndex: $selectedCategoryIndex, reviewList: $reviewList, reviewCategoryList: $reviewCategoryList)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ProductReviewStateImpl &&
            const DeepCollectionEquality()
                .equals(other.selectedCategoryIndex, selectedCategoryIndex) &&
            const DeepCollectionEquality()
                .equals(other._reviewList, _reviewList) &&
            const DeepCollectionEquality()
                .equals(other._reviewCategoryList, _reviewCategoryList));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(selectedCategoryIndex),
      const DeepCollectionEquality().hash(_reviewList),
      const DeepCollectionEquality().hash(_reviewCategoryList));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ProductReviewStateImplCopyWith<_$ProductReviewStateImpl> get copyWith =>
      __$$ProductReviewStateImplCopyWithImpl<_$ProductReviewStateImpl>(
          this, _$identity);
}

abstract class _ProductReviewState extends ProductReviewState {
  const factory _ProductReviewState(
      {final dynamic selectedCategoryIndex,
      final List<Review>? reviewList,
      final List<String>? reviewCategoryList}) = _$ProductReviewStateImpl;
  const _ProductReviewState._() : super._();

  @override
  dynamic get selectedCategoryIndex;
  @override
  List<Review>? get reviewList;
  @override
  List<String>? get reviewCategoryList;
  @override
  @JsonKey(ignore: true)
  _$$ProductReviewStateImplCopyWith<_$ProductReviewStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
