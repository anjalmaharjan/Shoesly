// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'order_summary_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$OrderSummaryState {
  double get subTotalCost => throw _privateConstructorUsedError;
  double get totalShippingCost => throw _privateConstructorUsedError;
  double get totalOrderCost => throw _privateConstructorUsedError;
  ApiRequestStates? get apiRequestStates => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $OrderSummaryStateCopyWith<OrderSummaryState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OrderSummaryStateCopyWith<$Res> {
  factory $OrderSummaryStateCopyWith(
          OrderSummaryState value, $Res Function(OrderSummaryState) then) =
      _$OrderSummaryStateCopyWithImpl<$Res, OrderSummaryState>;
  @useResult
  $Res call(
      {double subTotalCost,
      double totalShippingCost,
      double totalOrderCost,
      ApiRequestStates? apiRequestStates});
}

/// @nodoc
class _$OrderSummaryStateCopyWithImpl<$Res, $Val extends OrderSummaryState>
    implements $OrderSummaryStateCopyWith<$Res> {
  _$OrderSummaryStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? subTotalCost = null,
    Object? totalShippingCost = null,
    Object? totalOrderCost = null,
    Object? apiRequestStates = freezed,
  }) {
    return _then(_value.copyWith(
      subTotalCost: null == subTotalCost
          ? _value.subTotalCost
          : subTotalCost // ignore: cast_nullable_to_non_nullable
              as double,
      totalShippingCost: null == totalShippingCost
          ? _value.totalShippingCost
          : totalShippingCost // ignore: cast_nullable_to_non_nullable
              as double,
      totalOrderCost: null == totalOrderCost
          ? _value.totalOrderCost
          : totalOrderCost // ignore: cast_nullable_to_non_nullable
              as double,
      apiRequestStates: freezed == apiRequestStates
          ? _value.apiRequestStates
          : apiRequestStates // ignore: cast_nullable_to_non_nullable
              as ApiRequestStates?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$OrderSummaryStateImplCopyWith<$Res>
    implements $OrderSummaryStateCopyWith<$Res> {
  factory _$$OrderSummaryStateImplCopyWith(_$OrderSummaryStateImpl value,
          $Res Function(_$OrderSummaryStateImpl) then) =
      __$$OrderSummaryStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {double subTotalCost,
      double totalShippingCost,
      double totalOrderCost,
      ApiRequestStates? apiRequestStates});
}

/// @nodoc
class __$$OrderSummaryStateImplCopyWithImpl<$Res>
    extends _$OrderSummaryStateCopyWithImpl<$Res, _$OrderSummaryStateImpl>
    implements _$$OrderSummaryStateImplCopyWith<$Res> {
  __$$OrderSummaryStateImplCopyWithImpl(_$OrderSummaryStateImpl _value,
      $Res Function(_$OrderSummaryStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? subTotalCost = null,
    Object? totalShippingCost = null,
    Object? totalOrderCost = null,
    Object? apiRequestStates = freezed,
  }) {
    return _then(_$OrderSummaryStateImpl(
      subTotalCost: null == subTotalCost
          ? _value.subTotalCost
          : subTotalCost // ignore: cast_nullable_to_non_nullable
              as double,
      totalShippingCost: null == totalShippingCost
          ? _value.totalShippingCost
          : totalShippingCost // ignore: cast_nullable_to_non_nullable
              as double,
      totalOrderCost: null == totalOrderCost
          ? _value.totalOrderCost
          : totalOrderCost // ignore: cast_nullable_to_non_nullable
              as double,
      apiRequestStates: freezed == apiRequestStates
          ? _value.apiRequestStates
          : apiRequestStates // ignore: cast_nullable_to_non_nullable
              as ApiRequestStates?,
    ));
  }
}

/// @nodoc

class _$OrderSummaryStateImpl extends _OrderSummaryState {
  const _$OrderSummaryStateImpl(
      {this.subTotalCost = 0,
      this.totalShippingCost = 0,
      this.totalOrderCost = 0,
      this.apiRequestStates = ApiRequestStates.initial})
      : super._();

  @override
  @JsonKey()
  final double subTotalCost;
  @override
  @JsonKey()
  final double totalShippingCost;
  @override
  @JsonKey()
  final double totalOrderCost;
  @override
  @JsonKey()
  final ApiRequestStates? apiRequestStates;

  @override
  String toString() {
    return 'OrderSummaryState(subTotalCost: $subTotalCost, totalShippingCost: $totalShippingCost, totalOrderCost: $totalOrderCost, apiRequestStates: $apiRequestStates)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OrderSummaryStateImpl &&
            (identical(other.subTotalCost, subTotalCost) ||
                other.subTotalCost == subTotalCost) &&
            (identical(other.totalShippingCost, totalShippingCost) ||
                other.totalShippingCost == totalShippingCost) &&
            (identical(other.totalOrderCost, totalOrderCost) ||
                other.totalOrderCost == totalOrderCost) &&
            (identical(other.apiRequestStates, apiRequestStates) ||
                other.apiRequestStates == apiRequestStates));
  }

  @override
  int get hashCode => Object.hash(runtimeType, subTotalCost, totalShippingCost,
      totalOrderCost, apiRequestStates);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$OrderSummaryStateImplCopyWith<_$OrderSummaryStateImpl> get copyWith =>
      __$$OrderSummaryStateImplCopyWithImpl<_$OrderSummaryStateImpl>(
          this, _$identity);
}

abstract class _OrderSummaryState extends OrderSummaryState {
  const factory _OrderSummaryState(
      {final double subTotalCost,
      final double totalShippingCost,
      final double totalOrderCost,
      final ApiRequestStates? apiRequestStates}) = _$OrderSummaryStateImpl;
  const _OrderSummaryState._() : super._();

  @override
  double get subTotalCost;
  @override
  double get totalShippingCost;
  @override
  double get totalOrderCost;
  @override
  ApiRequestStates? get apiRequestStates;
  @override
  @JsonKey(ignore: true)
  _$$OrderSummaryStateImplCopyWith<_$OrderSummaryStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
