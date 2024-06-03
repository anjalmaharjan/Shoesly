import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'discover_state.dart';
part 'discover_cubit.freezed.dart';

class DiscoverCubit extends Cubit<DiscoverState> {
  DiscoverCubit() : super(const DiscoverState());

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
