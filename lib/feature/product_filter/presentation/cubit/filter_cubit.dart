import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'filter_state.dart';
part 'filter_cubit.freezed.dart';

class FilterCubit extends Cubit<FilterState> {
  FilterCubit() : super(const FilterState());

  void sortByFilterPress(int index) {
    emit(state.copyWith(sortByIndex: index));
  }

  void genderPress(int index) {
    emit(state.copyWith(genderIndex: index));
  }

  void colorPress(int index) {
    emit(state.copyWith(colorIndex: index));
  }

  void brandPress(int index) {
    emit(state.copyWith(brandIndex: index));
  }
}
