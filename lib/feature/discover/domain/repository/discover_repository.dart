import 'package:fpdart/fpdart.dart';
import 'package:shoesly/core/error/failures.dart';

import '../../../../core/product_model.dart';

abstract interface class DiscoverRepository {
  Future<Either<Failure, List<ProductModel>>> getProductList();
}
