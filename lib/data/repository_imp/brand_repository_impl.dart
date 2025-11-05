import '../../domain/models/brand.dart';
import '../../domain/repository/brand_repository.dart';
import '../remote_datasource/brand_remote_data_source.dart';

// এই ক্লাসটি BrandRepository ইন্টারফেসকে ইমপ্লিমেন্ট করে
class BrandRepositoryImpl implements BrandRepository {

  // BrandRepositoryImpl ক্লাসের কনস্ট্রাক্টর
  BrandRepositoryImpl({required this.remoteDataSource});

  // রিমোট ডেটা সোর্স থেকে ডেটা আনার জন্য একটি ফাইনাল ভ্যারিয়েবল
  final BrandRemoteDataSource remoteDataSource;

  // getBrands মেথডটি এখানে ইমপ্লিমেন্ট করা হয়েছে
  @override
  Future<List<Brand>> getBrands() {
    // এই মেথডটি সরাসরি remoteDataSource-এর fetchBrands মেথডকে কল করে
    return remoteDataSource.fetchBrands();
  }
}
