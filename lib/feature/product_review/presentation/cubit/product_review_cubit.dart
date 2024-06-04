import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../core/product_model.dart';

part 'product_review_state.dart';
part 'product_review_cubit.freezed.dart';

class ProductReviewCubit extends Cubit<ProductReviewState> {
  ProductReviewCubit() : super(const ProductReviewState());

  List<Review> reviewList = [];
  List<String> reviewCategoryList = [
    'All',
    '5 Stars',
    '4 Stars',
    '3 Stars',
    '2 Stars',
    '1 Star'
  ];

  void sortReviewList(List<Review> reviews) {
    reviewList.clear();
    reviewList.addAll(reviews);
    emit(state.copyWith(reviewList: reviewList));
  }

  void selectedCategory(int index) {
    final selectedCategory = reviewCategoryList[index];
    if (selectedCategory == 'All') {
      showAllReviews();
    } else {
      final filteredReviews =
          reviewList.where((review) => review.rating == index).toList();
      emit(
        state.copyWith(
            selectedCategoryIndex: index, reviewList: filteredReviews),
      );
    }
  }

  void showAllReviews() {
    emit(state.copyWith(selectedCategoryIndex: 0, reviewList: reviewList));
  }
}
