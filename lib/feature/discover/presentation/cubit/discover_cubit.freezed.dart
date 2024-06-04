// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'discover_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$DiscoverState {
  dynamic get categoryIndex => throw _privateConstructorUsedError;
  dynamic get showFilterButton => throw _privateConstructorUsedError;
  List<ProductModel>? get productModelList =>
      throw _privateConstructorUsedError;
  List<String>? get categoryList => throw _privateConstructorUsedError;
  String? get categoryName => throw _privateConstructorUsedError;
  ApiRequestStates get status => throw _privateConstructorUsedError;
  String get failureMessage => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $DiscoverStateCopyWith<DiscoverState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DiscoverStateCopyWith<$Res> {
  factory $DiscoverStateCopyWith(
          DiscoverState value, $Res Function(DiscoverState) then) =
      _$DiscoverStateCopyWithImpl<$Res, DiscoverState>;
  @useResult
  $Res call(
      {dynamic categoryIndex,
      dynamic showFilterButton,
      List<ProductModel>? productModelList,
      List<String>? categoryList,
      String? categoryName,
      ApiRequestStates status,
      String failureMessage});
}

/// @nodoc
class _$DiscoverStateCopyWithImpl<$Res, $Val extends DiscoverState>
    implements $DiscoverStateCopyWith<$Res> {
  _$DiscoverStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? categoryIndex = freezed,
    Object? showFilterButton = freezed,
    Object? productModelList = freezed,
    Object? categoryList = freezed,
    Object? categoryName = freezed,
    Object? status = null,
    Object? failureMessage = null,
  }) {
    return _then(_value.copyWith(
      categoryIndex: freezed == categoryIndex
          ? _value.categoryIndex
          : categoryIndex // ignore: cast_nullable_to_non_nullable
              as dynamic,
      showFilterButton: freezed == showFilterButton
          ? _value.showFilterButton
          : showFilterButton // ignore: cast_nullable_to_non_nullable
              as dynamic,
      productModelList: freezed == productModelList
          ? _value.productModelList
          : productModelList // ignore: cast_nullable_to_non_nullable
              as List<ProductModel>?,
      categoryList: freezed == categoryList
          ? _value.categoryList
          : categoryList // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      categoryName: freezed == categoryName
          ? _value.categoryName
          : categoryName // ignore: cast_nullable_to_non_nullable
              as String?,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as ApiRequestStates,
      failureMessage: null == failureMessage
          ? _value.failureMessage
          : failureMessage // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$DiscoverStateImplCopyWith<$Res>
    implements $DiscoverStateCopyWith<$Res> {
  factory _$$DiscoverStateImplCopyWith(
          _$DiscoverStateImpl value, $Res Function(_$DiscoverStateImpl) then) =
      __$$DiscoverStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {dynamic categoryIndex,
      dynamic showFilterButton,
      List<ProductModel>? productModelList,
      List<String>? categoryList,
      String? categoryName,
      ApiRequestStates status,
      String failureMessage});
}

/// @nodoc
class __$$DiscoverStateImplCopyWithImpl<$Res>
    extends _$DiscoverStateCopyWithImpl<$Res, _$DiscoverStateImpl>
    implements _$$DiscoverStateImplCopyWith<$Res> {
  __$$DiscoverStateImplCopyWithImpl(
      _$DiscoverStateImpl _value, $Res Function(_$DiscoverStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? categoryIndex = freezed,
    Object? showFilterButton = freezed,
    Object? productModelList = freezed,
    Object? categoryList = freezed,
    Object? categoryName = freezed,
    Object? status = null,
    Object? failureMessage = null,
  }) {
    return _then(_$DiscoverStateImpl(
      categoryIndex:
          freezed == categoryIndex ? _value.categoryIndex! : categoryIndex,
      showFilterButton: freezed == showFilterButton
          ? _value.showFilterButton!
          : showFilterButton,
      productModelList: freezed == productModelList
          ? _value._productModelList
          : productModelList // ignore: cast_nullable_to_non_nullable
              as List<ProductModel>?,
      categoryList: freezed == categoryList
          ? _value._categoryList
          : categoryList // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      categoryName: freezed == categoryName
          ? _value.categoryName
          : categoryName // ignore: cast_nullable_to_non_nullable
              as String?,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as ApiRequestStates,
      failureMessage: null == failureMessage
          ? _value.failureMessage
          : failureMessage // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$DiscoverStateImpl extends _DiscoverState {
  const _$DiscoverStateImpl(
      {this.categoryIndex = 0,
      this.showFilterButton = true,
      final List<ProductModel>? productModelList,
      final List<String>? categoryList,
      this.categoryName,
      this.status = ApiRequestStates.initial,
      this.failureMessage = ''})
      : _productModelList = productModelList,
        _categoryList = categoryList,
        super._();

  @override
  @JsonKey()
  final dynamic categoryIndex;
  @override
  @JsonKey()
  final dynamic showFilterButton;
  final List<ProductModel>? _productModelList;
  @override
  List<ProductModel>? get productModelList {
    final value = _productModelList;
    if (value == null) return null;
    if (_productModelList is EqualUnmodifiableListView)
      return _productModelList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<String>? _categoryList;
  @override
  List<String>? get categoryList {
    final value = _categoryList;
    if (value == null) return null;
    if (_categoryList is EqualUnmodifiableListView) return _categoryList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final String? categoryName;
  @override
  @JsonKey()
  final ApiRequestStates status;
  @override
  @JsonKey()
  final String failureMessage;

  @override
  String toString() {
    return 'DiscoverState(categoryIndex: $categoryIndex, showFilterButton: $showFilterButton, productModelList: $productModelList, categoryList: $categoryList, categoryName: $categoryName, status: $status, failureMessage: $failureMessage)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DiscoverStateImpl &&
            const DeepCollectionEquality()
                .equals(other.categoryIndex, categoryIndex) &&
            const DeepCollectionEquality()
                .equals(other.showFilterButton, showFilterButton) &&
            const DeepCollectionEquality()
                .equals(other._productModelList, _productModelList) &&
            const DeepCollectionEquality()
                .equals(other._categoryList, _categoryList) &&
            (identical(other.categoryName, categoryName) ||
                other.categoryName == categoryName) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.failureMessage, failureMessage) ||
                other.failureMessage == failureMessage));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(categoryIndex),
      const DeepCollectionEquality().hash(showFilterButton),
      const DeepCollectionEquality().hash(_productModelList),
      const DeepCollectionEquality().hash(_categoryList),
      categoryName,
      status,
      failureMessage);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$DiscoverStateImplCopyWith<_$DiscoverStateImpl> get copyWith =>
      __$$DiscoverStateImplCopyWithImpl<_$DiscoverStateImpl>(this, _$identity);
}

abstract class _DiscoverState extends DiscoverState {
  const factory _DiscoverState(
      {final dynamic categoryIndex,
      final dynamic showFilterButton,
      final List<ProductModel>? productModelList,
      final List<String>? categoryList,
      final String? categoryName,
      final ApiRequestStates status,
      final String failureMessage}) = _$DiscoverStateImpl;
  const _DiscoverState._() : super._();

  @override
  dynamic get categoryIndex;
  @override
  dynamic get showFilterButton;
  @override
  List<ProductModel>? get productModelList;
  @override
  List<String>? get categoryList;
  @override
  String? get categoryName;
  @override
  ApiRequestStates get status;
  @override
  String get failureMessage;
  @override
  @JsonKey(ignore: true)
  _$$DiscoverStateImplCopyWith<_$DiscoverStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
