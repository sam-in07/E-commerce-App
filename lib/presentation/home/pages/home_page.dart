import 'package:flutter/material.dart';

import '../../../domain/repository/brand_repository.dart';
import '../../../domain/repository/product_repository.dart';
import '../../../domain/repository/product_slider_repository.dart';

class HomePage  extends StatelessWidget {
  const HomePage({
    super.key,
    required this.brandRepository,
    required this.productSliderRepository,
    required this.productRepository,
  });

  final BrandRepository brandRepository;
  final ProductSliderRepository productSliderRepository;
  final ProductRepository productRepository;
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
