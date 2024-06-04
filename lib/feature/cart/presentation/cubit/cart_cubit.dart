import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../discover/data/models/product_model.dart';

part 'cart_state.dart';
part 'cart_cubit.freezed.dart';

class CartCubit extends Cubit<CartState> {
  CartCubit() : super(const CartState());

  List<ProductModel> productList = [];

  void addToCartList(ProductModel productModel) {
    bool productExists = false;
    for (var product in productList) {
      if (product.id == productModel.id) {
        product.cartQuantity =
            (product.cartQuantity ?? 0) + (productModel.cartQuantity ?? 1);
        productExists = true;
        break;
      }
    }

    if (!productExists) {
      productList.add(productModel);
    }

    double totalPrice = calculateTotalPrice(productList);
    emit(state.copyWith(cartProductList: productList, totalPrice: totalPrice));
  }

  double calculateTotalPrice(List<ProductModel> products) {
    double totalPrice = 0;
    for (var product in products) {
      final price = product.price ?? 0;
      final quantity = product.cartQuantity ?? 0;
      totalPrice += price * quantity;
    }
    return totalPrice;
  }

  void incrementQuantity(ProductModel product) {
    product.cartQuantity = (product.cartQuantity ?? 0) + 1;
    double totalPrice = calculateTotalPrice(productList);
    emit(state.copyWith(
        cartProductList: List.from(productList), totalPrice: totalPrice));
  }

  void decrementQuantity(ProductModel product) {
    if ((product.cartQuantity ?? 0) > 1) {
      product.cartQuantity = (product.cartQuantity ?? 0) - 1;
      double totalPrice = calculateTotalPrice(productList);
      emit(state.copyWith(
          cartProductList: List.from(productList), totalPrice: totalPrice));
    }
  }

  void removeFromCartList(int index) {
    if (index >= 0 && index < productList.length) {
      productList.removeAt(index);
      double totalPrice = calculateTotalPrice(productList);
      emit(
          state.copyWith(cartProductList: productList, totalPrice: totalPrice));
    }
  }
}
