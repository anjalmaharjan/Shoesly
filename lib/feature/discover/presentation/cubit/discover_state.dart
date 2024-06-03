part of 'discover_cubit.dart';

@freezed
class DiscoverState with _$DiscoverState {
  const DiscoverState._();
  const factory DiscoverState({
    @Default(0) categoryIndex,
    @Default(true) showFilterButton,
    List<ProductModel>? productModelList,
    @Default(ApiRequestStates.initial) ApiRequestStates status,
  }) = _DiscoverState;
}
