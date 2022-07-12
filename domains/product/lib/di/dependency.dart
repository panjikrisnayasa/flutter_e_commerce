import 'package:dependencies/get_it/get_it.dart';
import 'package:product/data/datasource/remote/product_remote_datasource.dart';
import 'package:product/data/mapper/product_mapper.dart';
import 'package:product/data/repository/product_repository_impl.dart';
import 'package:product/domain/repository/product_repository.dart';
import 'package:product/domain/usecases/get_banner_usecase.dart';
import 'package:product/domain/usecases/get_product_category_usecase.dart';
import 'package:product/domain/usecases/get_product_detail_usecase.dart';
import 'package:product/domain/usecases/get_product_usecase.dart';
import 'package:product/domain/usecases/get_seller_usecase.dart';

class ProductDependency {
  ProductDependency() {
    _registerDataSources();
    _registerMapper();
    _registerRepository();
    _registerUseCases();
  }

  void _registerDataSources() {
    sl.registerLazySingleton<ProductRemoteDataSource>(
      () => ProductRemoteDataSourceImpl(
        dio: sl(),
      ),
    );
  }

  void _registerMapper() => sl.registerLazySingleton<ProductMapper>(
        () => ProductMapper(),
      );

  void _registerRepository() => sl.registerLazySingleton<ProductRepository>(
        () => ProductRepositoryImpl(
          productRemoteDataSource: sl(),
          mapper: sl(),
        ),
      );

  void _registerUseCases() {
    sl.registerLazySingleton<GetProductUseCase>(
      () => GetProductUseCase(
        productRepository: sl(),
      ),
    );
    sl.registerLazySingleton<GetProductCategoryUseCase>(
      () => GetProductCategoryUseCase(
        productRepository: sl(),
      ),
    );
    sl.registerLazySingleton<GetBannerUseCase>(
      () => GetBannerUseCase(
        productRepository: sl(),
      ),
    );
    sl.registerLazySingleton<GetProductDetailUseCase>(
      () => GetProductDetailUseCase(
        productRepository: sl(),
      ),
    );
    sl.registerLazySingleton<GetSellerUseCase>(
      () => GetSellerUseCase(
        productRepository: sl(),
      ),
    );
  }
}