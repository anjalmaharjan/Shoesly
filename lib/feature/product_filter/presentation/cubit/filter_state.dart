part of 'filter_cubit.dart';

@freezed
class FilterState with _$FilterState {
  const FilterState._();
  const factory FilterState({
    @Default(0) sortByIndex,
    @Default(0) genderIndex,
    @Default(0) colorIndex,
    @Default(0) brandIndex,
  }) = _FilterState;
}
