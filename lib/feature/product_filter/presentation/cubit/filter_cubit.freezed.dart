// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'filter_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$FilterState {
  int get sortByIndex => throw _privateConstructorUsedError;
  int get genderIndex => throw _privateConstructorUsedError;
  int get colorIndex => throw _privateConstructorUsedError;
  int get brandIndex => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $FilterStateCopyWith<FilterState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FilterStateCopyWith<$Res> {
  factory $FilterStateCopyWith(
          FilterState value, $Res Function(FilterState) then) =
      _$FilterStateCopyWithImpl<$Res, FilterState>;
  @useResult
  $Res call({int sortByIndex, int genderIndex, int colorIndex, int brandIndex});
}

/// @nodoc
class _$FilterStateCopyWithImpl<$Res, $Val extends FilterState>
    implements $FilterStateCopyWith<$Res> {
  _$FilterStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? sortByIndex = null,
    Object? genderIndex = null,
    Object? colorIndex = null,
    Object? brandIndex = null,
  }) {
    return _then(_value.copyWith(
      sortByIndex: null == sortByIndex
          ? _value.sortByIndex
          : sortByIndex // ignore: cast_nullable_to_non_nullable
              as int,
      genderIndex: null == genderIndex
          ? _value.genderIndex
          : genderIndex // ignore: cast_nullable_to_non_nullable
              as int,
      colorIndex: null == colorIndex
          ? _value.colorIndex
          : colorIndex // ignore: cast_nullable_to_non_nullable
              as int,
      brandIndex: null == brandIndex
          ? _value.brandIndex
          : brandIndex // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$FilterStateImplCopyWith<$Res>
    implements $FilterStateCopyWith<$Res> {
  factory _$$FilterStateImplCopyWith(
          _$FilterStateImpl value, $Res Function(_$FilterStateImpl) then) =
      __$$FilterStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int sortByIndex, int genderIndex, int colorIndex, int brandIndex});
}

/// @nodoc
class __$$FilterStateImplCopyWithImpl<$Res>
    extends _$FilterStateCopyWithImpl<$Res, _$FilterStateImpl>
    implements _$$FilterStateImplCopyWith<$Res> {
  __$$FilterStateImplCopyWithImpl(
      _$FilterStateImpl _value, $Res Function(_$FilterStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? sortByIndex = null,
    Object? genderIndex = null,
    Object? colorIndex = null,
    Object? brandIndex = null,
  }) {
    return _then(_$FilterStateImpl(
      sortByIndex: null == sortByIndex
          ? _value.sortByIndex
          : sortByIndex // ignore: cast_nullable_to_non_nullable
              as int,
      genderIndex: null == genderIndex
          ? _value.genderIndex
          : genderIndex // ignore: cast_nullable_to_non_nullable
              as int,
      colorIndex: null == colorIndex
          ? _value.colorIndex
          : colorIndex // ignore: cast_nullable_to_non_nullable
              as int,
      brandIndex: null == brandIndex
          ? _value.brandIndex
          : brandIndex // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$FilterStateImpl extends _FilterState {
  const _$FilterStateImpl(
      {this.sortByIndex = 0,
      this.genderIndex = 0,
      this.colorIndex = 0,
      this.brandIndex = 0})
      : super._();

  @override
  @JsonKey()
  final int sortByIndex;
  @override
  @JsonKey()
  final int genderIndex;
  @override
  @JsonKey()
  final int colorIndex;
  @override
  @JsonKey()
  final int brandIndex;

  @override
  String toString() {
    return 'FilterState(sortByIndex: $sortByIndex, genderIndex: $genderIndex, colorIndex: $colorIndex, brandIndex: $brandIndex)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FilterStateImpl &&
            (identical(other.sortByIndex, sortByIndex) ||
                other.sortByIndex == sortByIndex) &&
            (identical(other.genderIndex, genderIndex) ||
                other.genderIndex == genderIndex) &&
            (identical(other.colorIndex, colorIndex) ||
                other.colorIndex == colorIndex) &&
            (identical(other.brandIndex, brandIndex) ||
                other.brandIndex == brandIndex));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, sortByIndex, genderIndex, colorIndex, brandIndex);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$FilterStateImplCopyWith<_$FilterStateImpl> get copyWith =>
      __$$FilterStateImplCopyWithImpl<_$FilterStateImpl>(this, _$identity);
}

abstract class _FilterState extends FilterState {
  const factory _FilterState(
      {final int sortByIndex,
      final int genderIndex,
      final int colorIndex,
      final int brandIndex}) = _$FilterStateImpl;
  const _FilterState._() : super._();

  @override
  int get sortByIndex;
  @override
  int get genderIndex;
  @override
  int get colorIndex;
  @override
  int get brandIndex;
  @override
  @JsonKey(ignore: true)
  _$$FilterStateImplCopyWith<_$FilterStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
