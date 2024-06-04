import 'package:shoesly/feature/discover/data/models/product_model.dart';

class ProductListSingleton {
  static final ProductListSingleton _instance =
      ProductListSingleton._internal();

  final List<ProductModel> productList = [];

  factory ProductListSingleton() {
    return _instance;
  }

  static ProductListSingleton get instance => _instance;

  ProductListSingleton._internal();
}
