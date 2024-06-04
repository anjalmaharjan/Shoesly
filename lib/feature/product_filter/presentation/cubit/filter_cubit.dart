import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:shoesly/core/core.dart';
import 'package:shoesly/core/singletons/product_list_singleton.dart';
import 'package:shoesly/core/product_model.dart';

part 'filter_state.dart';
part 'filter_cubit.freezed.dart';

class FilterCubit extends Cubit<FilterState> {
  FilterCubit() : super(const FilterState());

  void fetchProductList() {
    final productList = ProductListSingleton.instance.productList;
    final Map<String, Map<String, dynamic>> brandFilter = {};

    for (ProductModel product in productList) {
      if (product.brand != null) {
        final String brandName = product.brand!;

        if (!brandFilter.containsKey(brandName)) {
          brandFilter[brandName] = {
            'name': brandName,
            'totalProducts': 0,
            'brandLogo': product.brandLogo,
            'products': <ProductModel>[],
          };
        }

        brandFilter[brandName]!['totalProducts']++;
        (brandFilter[brandName]!['products'] as List<ProductModel>)
            .add(product);
      }
    }

    final List<Map<String, dynamic>> data = brandFilter.values.toList();
    emit(state.copyWith(brandFilter: data));
  }

  void rangeFilter(RangeValues range) {
    emit(state.copyWith(priceRange: range));
  }

  void sortByFilterPress(int index) {
    emit(
      state.copyWith(
        sortByIndex: index,
        sortBy: FilterConstants.sortByList[index],
      ),
    );
  }

  void genderPress(int index) {
    emit(
      state.copyWith(
        genderIndex: index,
        gender: Gender.values[index],
      ),
    );
  }

  void colorPress(int index) {
    emit(
      state.copyWith(
        colorIndex: index,
        color: FilterConstants.shoesColor[index]['color'].toString(),
      ),
    );
  }

  void brandPress(int index, String brandName) {
    emit(
      state.copyWith(
        brandIndex: index,
        brandName: brandName.toString(),
      ),
    );
  }

  void resetFilters() {
    emit(
      state.copyWith(
        priceRange:
            const RangeValues(0, 2000), // Assuming this is your default range
        sortByIndex: 0,
        sortBy: FilterConstants.sortByList[0],
        genderIndex: 0,
        gender: Gender.values[0],
        colorIndex: 0,
        color: FilterConstants.shoesColor[0]['color'].toString(),
        brandIndex: -1,
        brandName: '', // Assuming empty string is your default
      ),
    );
  }

  Map<String, dynamic> getAppliedFilters() {
    return {
      'priceRange': state.priceRange ?? const RangeValues(0, 2000),
      'sortByIndex': state.sortByIndex,
      'sortBy': state.sortBy.isEmpty ? "" : state.sortBy,
      'genderIndex': state.genderIndex,
      'gender': state.gender,
      'colorIndex': state.colorIndex,
      'color': state.color,
      'brandIndex': state.brandIndex == 0 ? 0 : state.brandIndex,
      'brandName': state.brandName.isEmpty ? "All" : state.brandName,
    };
  }
}
