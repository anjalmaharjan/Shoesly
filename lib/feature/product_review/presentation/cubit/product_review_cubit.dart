import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'product_review_state.dart';
part 'product_review_cubit.freezed.dart';

class ProductReviewCubit extends Cubit<ProductReviewState> {
  ProductReviewCubit() : super(const ProductReviewState());

  void selectedCategory(int index) {
    emit(state.copyWith(selectedCategoryIndex: index));
  }
}
