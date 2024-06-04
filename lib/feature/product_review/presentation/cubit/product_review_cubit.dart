import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../core/product_model.dart';

part 'product_review_state.dart';
part 'product_review_cubit.freezed.dart';

class ProductReviewCubit extends Cubit<ProductReviewState> {
  ProductReviewCubit() : super(const ProductReviewState());

  List<Review> reviewList = [];
  List<String> reviewCategoryList = [];

  void sortReviewList(List<Review> reviews) {
    reviewList.clear();
    reviewList.addAll(reviews);
    reviewCategoryList.clear();
    final existingRatings = reviewList.map((review) => review.rating).toSet();
    // Sort ratings in descending order and add to the category list
    final sortedRatings = existingRatings.toList()
      ..sort((a, b) => b!.compareTo(a!));
    for (var rating in sortedRatings) {
      reviewCategoryList.add('$rating Stars');
    }
    reviewCategoryList.insert(0, 'All');
    emit(state.copyWith(
        reviewList: reviewList, reviewCategoryList: reviewCategoryList));
  }

  void selectedCategory(int index) {
    final selectedCategory = reviewCategoryList[index];
    if (selectedCategory == 'All') {
      showAllReviews();
    } else {
      final filteredReviews = reviewList
          .where(
            (review) =>
                review.rating == int.parse(selectedCategory.split(' ')[0]),
          )
          .toList();
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
