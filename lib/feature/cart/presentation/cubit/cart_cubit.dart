import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../core/product_model.dart';

part 'cart_state.dart';
part 'cart_cubit.freezed.dart';

class CartCubit extends Cubit<CartState> {
  CartCubit() : super(const CartState());

  List<ProductModel> productList = [];

  void addToCartList(ProductModel productModel) {
    productList.add(productModel);
    double totalPrice = calculateTotalPrice(productList);
    print(totalPrice);
    emit(state.copyWith(cartProductList: productList, totalPrice: totalPrice));
  }

  void removeFromCartList(int index) {
    if (index >= 0 && index < productList.length) {
      productList.removeAt(index);
      double totalPrice = calculateTotalPrice(productList);
      emit(
          state.copyWith(cartProductList: productList, totalPrice: totalPrice));
    }
  }

  double calculateTotalPrice(List<ProductModel> productList) {
    return productList.fold(
        0,
        (sum, product) =>
            sum +
            (product.price ?? 0 * double.parse("${product.cartQuantity}")));
  }
}
