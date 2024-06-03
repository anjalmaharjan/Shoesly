import 'package:get_it/get_it.dart';
import 'package:shoesly/feature/discover/domain/usecases/discover_product.dart';
import 'package:shoesly/feature/discover/presentation/cubit/discover_cubit.dart';
import 'package:shoesly/feature/product_detail/presentation/cubit/product_detail_cubit.dart';
import 'feature/discover/data/datasources/discover_remote_data_source.dart';
import 'feature/discover/data/repository/discover_repository_impl.dart';

final serviceLocator = GetIt.instance;

Future<void> initDependencies() async {
  serviceLocator.registerLazySingleton<DiscoverCubit>(
    () => DiscoverCubit(
      discoverProduct: serviceLocator(),
    ),
  );
  serviceLocator.registerLazySingleton<DiscoverRemoteDataSourceImpl>(
    () => DiscoverRemoteDataSourceImpl(
      serviceLocator(),
    ),
  );
  serviceLocator.registerLazySingleton<DiscoverRepositoryImpl>(
    () => DiscoverRepositoryImpl(
      serviceLocator(),
    ),
  );
  serviceLocator.registerLazySingleton<DiscoverProductUsecase>(
    () => DiscoverProductUsecase(
      serviceLocator(),
    ),
  );

  serviceLocator
      .registerLazySingleton<ProductDetailCubit>(() => ProductDetailCubit());
}
