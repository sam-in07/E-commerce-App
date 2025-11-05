

import '../../domain/models/product.dart';
import '../../domain/repository/product_repository.dart';
import '../remote_datasource/product_remote_data_source.dart';

class ProductRepositoryImpl implements ProductRepository {
  ProductRepositoryImpl({required this.remoteDataSource});

  final ProductRemoteDataSource remoteDataSource;

  // @override
  // Future<List<Product>> getProducts() {
  //   return remoteDataSource.fetchProducts();
  // }

  @override
  Future<List<Product>> getProductsByBrand(int brandId) {
    return remoteDataSource.fetchProductsByBrand(brandId);
  }
}