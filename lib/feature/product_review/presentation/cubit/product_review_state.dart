part of 'product_review_cubit.dart';

@freezed
class ProductReviewState with _$ProductReviewState {
  const ProductReviewState._();
  const factory ProductReviewState({
    @Default(0) selectedCategoryIndex,
  }) = _ProductReviewState;
}
