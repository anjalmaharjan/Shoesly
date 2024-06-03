import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../core/product_model.dart';

part 'order_summary_state.dart';
part 'order_summary_cubit.freezed.dart';

class OrderSummaryCubit extends Cubit<OrderSummaryState> {
  OrderSummaryCubit() : super(const OrderSummaryState());

  void totalShippingCost(List<ProductModel> products) {
    double totalPrice = 0;
    for (var product in products) {
      final price = product.price ?? 0;
      final quantity = product.cartQuantity ?? 0;
      final shippingCost = product.shippingCost ?? 0;
      totalPrice += (price * quantity) + shippingCost;
    }
    emit(state.copyWith(totalOrderCost: totalPrice));
  }
}
