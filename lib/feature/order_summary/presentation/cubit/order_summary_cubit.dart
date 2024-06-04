import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../core/product_model.dart';

part 'order_summary_state.dart';
part 'order_summary_cubit.freezed.dart';

class OrderSummaryCubit extends Cubit<OrderSummaryState> {
  OrderSummaryCubit() : super(const OrderSummaryState());

  double totalShippingCost(List<ProductModel> products) {
    double totalCost = products.fold(0.0,
        (sum, product) => sum + double.parse(product.shippingCost.toString()));
    emit(state.copyWith(totalShippingCost: totalCost));
    return totalCost;
  }

  double subTotalCost(List<ProductModel> products) {
    double totalCost = products.fold(0.0, (sum, product) {
      return sum + (product.price ?? 0) * (product.cartQuantity ?? 0.0);
    });
    emit(state.copyWith(subTotalCost: totalCost));
    return totalCost;
  }

  void grandTotal(List<ProductModel> products) {
    final grandTotal = subTotalCost(products) + totalShippingCost(products);
    emit(state.copyWith(totalOrderCost: grandTotal));
  }
}
