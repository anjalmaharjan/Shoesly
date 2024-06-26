import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'product_detail_state.dart';
part 'product_detail_cubit.freezed.dart';

class ProductDetailCubit extends Cubit<ProductDetailState> {
  ProductDetailCubit() : super(const ProductDetailState());

  final TextEditingController quantityController = TextEditingController();

  void selectedShoeSize(int index) {
    emit(state.copyWith(shoeSize: index));
  }

  void isCartAdded(bool addToCart) {
    emit(state.copyWith(addedToCart: addToCart));
  }

  void selectProductColor(int colorIndex) {
    emit(state.copyWith(selectedColor: colorIndex));
  }

  void incrementQuantity(int quantity, double price) {
    int newQuantity = quantity + 1;
    double newTotalPrice = price * newQuantity;
    emit(state.copyWith(quantity: newQuantity, totalPrice: newTotalPrice));
  }

  void decrementQuantity(int quantity, double price) {
    if (quantity > 1) {
      int newQuantity = quantity - 1;
      double newTotalPrice = price * newQuantity;
      emit(state.copyWith(quantity: newQuantity, totalPrice: newTotalPrice));
    }
  }

  void changeQuantityTyping(int quantity, double price) {
    emit(state.copyWith(quantity: quantity, totalPrice: price * quantity));
  }

  void resetQuantityAndTotalPrice() {
    emit(
      state.copyWith(quantity: 1, totalPrice: 0.0),
    );
  }
}
