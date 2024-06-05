import 'package:fpdart/fpdart.dart';
import 'package:shoesly/core/error/exceptions.dart';
import 'package:shoesly/core/error/failures.dart';
import 'package:shoesly/core/network/connection_checker.dart';
import 'package:shoesly/feature/discover/data/datasources/discover_remote_data_source.dart';
import 'package:shoesly/feature/discover/domain/repository/discover_repository.dart';

import '../models/product_model.dart';

class DiscoverRepositoryImpl implements DiscoverRepository {
  final DiscoverRemoteDataSource discoverRemoteDataSource;
  final ConnectionChecker connectionChecker;
  const DiscoverRepositoryImpl(
      this.discoverRemoteDataSource, this.connectionChecker);

  @override
  Future<Either<Failure, List<ProductModel>>> getProductList() async {
    try {
      if (!await connectionChecker.isConnected) {
        return left(Failure("No Internet Connection!"));
      }
      final response = await discoverRemoteDataSource.getProductList();
      return right(response);
    } on ServerException catch (e) {
      return left(Failure(e.message));
    }
  }
}
