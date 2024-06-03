import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:shoesly/core/enum/enum.dart';
import 'package:shoesly/core/product_model.dart';
import 'package:shoesly/core/usecase/usecase.dart';
import 'package:shoesly/feature/discover/domain/usecases/discover_product.dart';

part 'discover_state.dart';
part 'discover_cubit.freezed.dart';

class DiscoverCubit extends Cubit<DiscoverState> {
  final DiscoverProductUsecase _discoverProduct;
  DiscoverCubit({
    required DiscoverProductUsecase discoverProduct,
  })  : _discoverProduct = discoverProduct,
        super(const DiscoverState());

  void fetchDiscoverProducts() async {
    emit(state.copyWith(status: ApiRequestStates.loading));
    final response = await _discoverProduct(NoParams());
    response.fold(
      (l) => emit(
        state.copyWith(status: ApiRequestStates.error),
      ),
      (r) {
        print(r);
        emit(
          state.copyWith(productModelList: r, status: ApiRequestStates.success),
        );
      },
    );
  }

  bool showFilterButton(UserScrollNotification notification) {
    final ScrollDirection direction = notification.direction;
    if (direction == ScrollDirection.reverse &&
        notification.metrics.axis != Axis.horizontal) {
      emit(state.copyWith(showFilterButton: false));
      return false;
    } else if (direction == ScrollDirection.forward &&
        notification.metrics.axis != Axis.horizontal) {
      emit(state.copyWith(showFilterButton: true));
      return true;
    }
    emit(state.copyWith(showFilterButton: true));
    return true;
  }

  void selectCategory(int index) {
    emit(state.copyWith(categoryIndex: index));
  }
}
