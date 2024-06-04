part of 'discover_cubit.dart';

@freezed
class DiscoverState with _$DiscoverState {
  const DiscoverState._();
  const factory DiscoverState({
    @Default(0) categoryIndex,
    @Default(true) showFilterButton,
    List<ProductModel>? productModelList,
    List<String>? categoryList,
    String? categoryName,
    @Default(ApiRequestStates.initial) ApiRequestStates status,
    @Default('') String failureMessage,
  }) = _DiscoverState;
}
