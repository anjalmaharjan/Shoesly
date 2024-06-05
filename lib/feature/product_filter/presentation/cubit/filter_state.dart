part of 'filter_cubit.dart';

@freezed
class FilterState with _$FilterState {
  const FilterState._();
  const factory FilterState({
    @Default(0) int sortByIndex,
    @Default(0) int genderIndex,
    @Default(0) int colorIndex,
    @Default(-1) int brandIndex,
    @Default("") String brandName,
    RangeValues? priceRange,
    @Default("") String sortBy,
    Gender? gender,
    @Default("") String color,
    List<Map<String, dynamic>>? brandFilter,
  }) = _FilterState;
}
