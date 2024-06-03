import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'product_detail_state.dart';
part 'product_detail_cubit.freezed.dart';

class ProductDetailCubit extends Cubit<ProductDetailState> {
  ProductDetailCubit() : super(const ProductDetailState());

  void selectedShoeSize(int index) {
    emit(state.copyWith(shoeSize: index));
  }

  void addToCart(bool addToCart) {
    emit(state.copyWith(addedToCart: addToCart));
  }

  void selectProductColor(int colorIndex) {
    emit(state.copyWith(selectedColor: colorIndex));
  }
}
