part of 'product_detail_cubit.dart';

@freezed
class ProductDetailState with _$ProductDetailState {
  const ProductDetailState._();
  const factory ProductDetailState({
    @Default(0) int shoeSize,
    @Default(false) bool addedToCart,
    @Default(1) int selectedColor,
  }) = _ProductDetailState;
}
