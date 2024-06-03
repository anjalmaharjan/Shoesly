part of 'discover_cubit.dart';

@freezed
class DiscoverState with _$DiscoverState {
  const DiscoverState._();
  const factory DiscoverState({
    @Default(0) categoryIndex,
    @Default(true) showFilterButton,
  }) = _DiscoverState;
}
