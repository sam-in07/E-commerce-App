
import 'package:flutter/material.dart';

import '../../../domain/repository/brand_repository.dart';
import '../../../domain/repository/category_repository.dart';
import '../../../domain/repository/product_repository.dart';
import '../../../domain/repository/product_slider_repository.dart';
import 'home_page.dart';
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

  @override
  void initState() {
    super.initState();
    _pages = [
      HomePage(
        brandRepository: widget.brandRepository,
        productSliderRepository: widget.productSliderRepository,
        productRepository: widget.productRepository,
      ),
      // CategoriesPage(categoryRepository: widget.categoryRepository),
      // const CartPage(),
      // const ProfilePage(),
    ];
  }
//page handling
  @override
  Widget build(BuildContext context) {
    // Scaffold হলো একটি বেসিক ম্যাটেরিয়াল ডিজাইন লেআউট স্ট্রাকচার
    return Scaffold(
      // body: IndexedStack(...) দিয়ে দেখানো হয় কোন পেজটি বর্তমানে দৃশ্যমান হবে
      body: IndexedStack(index: _currentIndex, children: _pages),

      // bottomNavigationBar: NavigationBar(...) হলো নিচের নেভিগেশন বার
      bottomNavigationBar: NavigationBar(
        selectedIndex: _currentIndex, // কোনটি বর্তমানে সিলেক্টেড আছে
        onDestinationSelected: (index) { // যখন কোনো আইটেম ট্যাপ করা হয়
          setState(() {
            _currentIndex = index; // _currentIndex-এর মান পরিবর্তন করে UI রি-বিল্ড করা হয়
          });
        },
        // destinations হলো নেভিগেশন বারের আইটেমগুলো
        destinations: const [
          NavigationDestination(
            icon: Icon(Icons.home_outlined), // সাধারণ আইকন
            selectedIcon: Icon(Icons.home), // সিলেক্টেড состояния আইকন
            label: 'Home', // আইটেমের নাম
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