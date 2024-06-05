import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:shoesly/core/enum/enum.dart';
import 'package:shoesly/feature/order_summary/data/models/payment_model.dart';
import 'package:shoesly/feature/order_summary/domain/usecases/order_summary_usecase.dart';

import '../../../discover/data/models/product_model.dart';

part 'order_summary_state.dart';
part 'order_summary_cubit.freezed.dart';

class OrderSummaryCubit extends Cubit<OrderSummaryState> {
  final OrderSummaryUsecase _orderSummaryUsecase;
  OrderSummaryCubit({required OrderSummaryUsecase orderSummaryUsecase})
      : _orderSummaryUsecase = orderSummaryUsecase,
        super(const OrderSummaryState());

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

  void postPaymentToDb(PaymentModel model) {
    emit(state.copyWith(apiRequestStates: ApiRequestStates.loading));
    _orderSummaryUsecase(model);
    emit(state.copyWith(apiRequestStates: ApiRequestStates.success));
  }
}
