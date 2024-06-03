part of 'filter_cubit.dart';

@freezed
class FilterState with _$FilterState {
  const FilterState._();
  const factory FilterState({
    @Default(0) int sortByIndex,
    @Default(0) int genderIndex,
    @Default(0) int colorIndex,
    @Default(0) int brandIndex,
  }) = _FilterState;
}
