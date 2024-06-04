import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:shoesly/core/enum/enum.dart';
import 'package:shoesly/core/singletons/product_list_singleton.dart';
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

  List<String> categoryList = [];
  Map<String, List<ProductModel>> categoryProductMap = {};
  final ProductListSingleton _listSingleton = ProductListSingleton();
  final controller = ScrollController();

  void fetchDiscoverProducts() async {
    emit(state.copyWith(status: ApiRequestStates.loading));
    final response = await _discoverProduct(NoParams());
    response.fold(
      (l) => emit(
        state.copyWith(status: ApiRequestStates.error),
      ),
      (r) {
        _listSingleton.productList.addAll(r);
        emit(
          state.copyWith(productModelList: r, status: ApiRequestStates.success),
        );
        sortProductCategory(r);
      },
    );
  }

  void sortProductCategory(List<ProductModel> productList) {
    final uniqueCategories = <String>{};
    categoryProductMap.clear();

    for (var product in productList) {
      if (product.brand != null) {
        uniqueCategories.add(product.brand!);
        categoryProductMap.putIfAbsent(product.brand!, () => []).add(product);
      }
    }
    categoryList = uniqueCategories.toList();
    categoryList.insert(0, "All");
    emit(state.copyWith(categoryList: categoryList));
  }

  void selectCategory({
    int index = 0,
    Map<String, dynamic>? filters,
    String categoryName = "All",
  }) {
    print(filters);
    final selectedCategory = categoryList[index];
    if (selectedCategory == "All") {
      showAllProducts(filters: filters);
    } else {
      final filteredProducts =
          filters?['brandName'] ?? categoryProductMap[selectedCategory] ?? [];

      if (filters != null) {
        final priceStart =
            filters['priceRange'] == null ? 0 : filters['priceRange'].start;
        final priceEnd =
            filters['priceRange'] == null ? 0 : filters['priceRange'].end;
        filteredProducts.retainWhere((product) {
          final meetsPriceRange =
              product.price! >= priceStart && product.price! <= priceEnd;
          final meetsBrand = product.brand == filters['brandName'];
          return meetsPriceRange && meetsBrand;
        });
        filteredProducts.sort((a, b) => b.price!.compareTo(a.price!));
      }
      // Sort products from highest to lowest price
      emit(
        state.copyWith(
          categoryIndex: (filters?['brandName'] != null) ? index + 1 : index,
          productModelList: filteredProducts,
          categoryName: filters?['brandName'] ?? "All",
        ),
      );
    }
  }

  void showAllProducts({
    Map<String, dynamic>? filters,
  }) {
    final List<ProductModel> allProducts = [];
    for (var productList in categoryProductMap.values) {
      allProducts.addAll(productList);
    }

    List<ProductModel> productListToFilter = allProducts;

    // Apply filters if provided
    if (filters != null) {
      final double priceStart = filters['priceRange']?.start ?? 0;
      final double priceEnd = filters['priceRange']?.end ?? double.infinity;
      final String? brandName = filters['brandName'];

      // Use the global product list if the brand is "All"
      if (brandName == "All") {
        productListToFilter = ProductListSingleton.instance.productList;
      }

      // Apply the filters
      productListToFilter = productListToFilter.where((product) {
        final bool meetsPriceRange =
            product.price! >= priceStart && product.price! <= priceEnd;
        final bool meetsBrand = brandName == null ||
            brandName == "All" ||
            product.brand == brandName;
        return meetsPriceRange && meetsBrand;
      }).toList();
    }

    // Sort products based on the 'sortBy' filter
    if (filters != null) {
      final String? sortBy = filters['sortBy']?.toString().toLowerCase();
      if (sortBy == 'lowest price') {
        productListToFilter.sort((a, b) => a.price!.compareTo(b.price!));
      } else if (sortBy == 'highest price') {
        productListToFilter.sort((a, b) => b.price!.compareTo(a.price!));
      } else {
        productListToFilter.sort((a, b) => b.price!.compareTo(a.price!));
      }
    } else {
      // Default sorting: highest to lowest price
      productListToFilter.sort((a, b) => b.price!.compareTo(a.price!));
    }

    emit(
      state.copyWith(
        categoryIndex:
            (filters?['brandName'] != null) ? filters!['brandIndex'] + 1 : 0,
        productModelList: productListToFilter,
      ),
    );
    scrollToCategoryIndex(
        (filters?['brandName'] != null) ? filters!['brandIndex'] + 1 : 0);
  }

  ScrollController scrollController = ScrollController();

  void scrollToCategoryIndex(int index) {
    double itemWidth = index >= 4 ? 100 : 0;
    final double offset = index * itemWidth;
    scrollController.animateTo(
      offset,
      duration: const Duration(milliseconds: 800),
      curve: Curves.easeIn,
    );
  }
}
