
import '../models/brand.dart';

abstract class BrandRepository {
  Future<List<Brand>> getBrands();
}