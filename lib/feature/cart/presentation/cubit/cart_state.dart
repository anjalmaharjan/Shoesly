part of 'cart_cubit.dart';

@freezed
class CartState with _$CartState {
  const CartState._();
  const factory CartState({
    List<ProductModel>? cartProductList,
    double? totalPrice,
  }) = _CartState;
}
