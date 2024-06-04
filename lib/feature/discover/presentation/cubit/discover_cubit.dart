import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:shoesly/core/enum/enum.dart';
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

  void fetchDiscoverProducts() async {
    emit(state.copyWith(status: ApiRequestStates.loading));
    final response = await _discoverProduct(NoParams());
    response.fold(
      (l) => emit(
        state.copyWith(status: ApiRequestStates.error),
      ),
      (r) {
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

  void selectCategory(int index) {
    final selectedCategory = categoryList[index];
    if (selectedCategory == "All") {
      showAllProducts();
    } else {
      final filteredProducts = categoryProductMap[selectedCategory] ?? [];
      emit(
        state.copyWith(
            categoryIndex: index, productModelList: filteredProducts),
      );
    }
  }

  void showAllProducts() {
    final List<ProductModel> allProducts = [];
    for (var productList in categoryProductMap.values) {
      allProducts.addAll(productList);
    }
    emit(state.copyWith(categoryIndex: 0, productModelList: allProducts));
  }
}
