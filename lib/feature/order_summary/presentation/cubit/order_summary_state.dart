part of 'order_summary_cubit.dart';

@freezed
class OrderSummaryState with _$OrderSummaryState {
  const OrderSummaryState._();
  const factory OrderSummaryState({
    @Default(0) double subTotalCost,
    @Default(0) double totalShippingCost,
    @Default(0) double totalOrderCost,
  }) = _OrderSummaryState;
}
