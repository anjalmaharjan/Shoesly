import 'package:fpdart/fpdart.dart';
import 'package:shoesly/core/error/exceptions.dart';
import 'package:shoesly/core/error/failures.dart';
import 'package:shoesly/feature/discover/data/datasources/discover_remote_data_source.dart';
import 'package:shoesly/feature/discover/domain/repository/discover_repository.dart';

import '../../../../core/product_model.dart';

class DiscoverRepositoryImpl implements DiscoverRepository {
  final DiscoverRemoteDataSource discoverRemoteDataSource;
  const DiscoverRepositoryImpl(this.discoverRemoteDataSource);

  @override
  Future<Either<Failure, List<ProductModel>>> getProductList() async {
    try {
      final response = await discoverRemoteDataSource.getProductList();
      return right(response);
    } on ServerException catch (e) {
      return left(Failure(e.message));
    }
  }
}
