import 'package:fpdart/src/either.dart';
import 'package:shoesly/core/error/failures.dart';
import 'package:shoesly/core/product_model.dart';
import 'package:shoesly/core/usecase/usecase.dart';
import 'package:shoesly/feature/discover/domain/repository/discover_repository.dart';

class DiscoverProductUsecase implements UseCase<List<ProductModel>, NoParams> {
  final DiscoverRepository discoverRepository;
  const DiscoverProductUsecase(this.discoverRepository);

  @override
  Future<Either<Failure, List<ProductModel>>> call(NoParams params) async {
    return await discoverRepository.getProductList();
  }
}
