
import 'package:flutter/material.dart';

import '../../../domain/repository/brand_repository.dart';
import '../../../domain/repository/category_repository.dart';
import '../../../domain/repository/product_repository.dart';
import '../../../domain/repository/product_slider_repository.dart';
//bottom navi full
class MainNavigationPage extends StatefulWidget {
  const MainNavigationPage({
    super.key,
    required this.brandRepository,
    required this.categoryRepository,
    required this.productSliderRepository,
    required this.productRepository,
  }) ;
  // {
  //   // TODO: implement MainNavigationPage
  //   throw UnimplementedError();
  // }

  final BrandRepository brandRepository;
  final CategoryRepository categoryRepository;
  final ProductSliderRepository productSliderRepository;
  final ProductRepository productRepository;

  @override
  State<MainNavigationPage> createState() => _MainNavigationPageState();
}

class _MainNavigationPageState extends State<MainNavigationPage> {
  int _currentIndex = 0;

  late final List<Widget> _pages;

  // @override
  // void initState() {
  //   super.initState();
  //   _pages = [
  //     HomePage(
  //       brandRepository: widget.brandRepository,
  //       productSliderRepository: widget.productSliderRepository,
  //       productRepository: widget.productRepository,
  //     ),
  //     CategoriesPage(categoryRepository: widget.categoryRepository),
  //     const CartPage(),
  //     const ProfilePage(),
  //   ];
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(index: _currentIndex, children: _pages),
      bottomNavigationBar: NavigationBar(
        selectedIndex: _currentIndex,
        onDestinationSelected: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        destinations: const [
          NavigationDestination(
            icon: Icon(Icons.home_outlined),
            selectedIcon: Icon(Icons.home),
            label: 'Home',
          ),
          NavigationDestination(
            icon: Icon(Icons.category_outlined),
            selectedIcon: Icon(Icons.category),
            label: 'Categories',
          ),
          NavigationDestination(
            icon: Icon(Icons.shopping_cart_outlined),
            selectedIcon: Icon(Icons.shopping_cart),
            label: 'Cart',
          ),
          NavigationDestination(
            icon: Icon(Icons.person_outline),
            selectedIcon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}

// Removed unused placeholder page