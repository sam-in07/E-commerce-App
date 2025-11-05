

import '../../domain/models/category.dart';
import '../../domain/repository/category_repository.dart';
import '../remote_datasource/category_remote_data_source.dart';

class CategoryRepositoryImpl implements CategoryRepository {
  CategoryRepositoryImpl({required this.remoteDataSource});

  final CategoryRemoteDataSource remoteDataSource;

  @override
  Future<List<Category>> getCategories() {
    return remoteDataSource.fetchCategories();
  }
}