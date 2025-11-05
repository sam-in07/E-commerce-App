import 'package:e_comm_app/core/network/api_client.dart';
import 'package:e_comm_app/presentation/home/pages/MyHomePage.dart';
import 'package:flutter/material.dart';

import 'data/remote_datasource/brand_remote_data_source.dart';
import 'data/remote_datasource/category_remote_data_source.dart';
import 'data/remote_datasource/product_remote_data_source.dart';
import 'data/remote_datasource/product_slider_remote_data_source.dart';
import 'data/repository_imp/brand_repository_impl.dart';

void main() {
  runApp(const EcomApp());
}

class EcomApp extends StatelessWidget {
  const EcomApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final apiClient  =  ApiClient(
      baseUrl: 'https://ecommerce-api.codesilicon.com',
    );
    // Initialize data sources
    final brandRemoteDataSource = BrandRemoteDataSource(apiClient: apiClient);

    final categoryRemoteDataSource = CategoryRemoteDataSource(
      apiClient: apiClient,
    );

    final productSliderRemoteDataSource = ProductSliderRemoteDataSource(
      apiClient: apiClient,
    );

    final productRemoteDataSource = ProductRemoteDataSource(
      apiClient: apiClient,
    );

    // Initialize repositories


    return MaterialApp(
      title: 'E-Comm App',
      theme:ThemeData(
        useMaterial3: true,

        colorSchemeSeed: const Color(0xFF6750A4),
        appBarTheme: const AppBarTheme(centerTitle: true, elevation: 0),
        // cardTheme: CardTheme(
        //   elevation: 2,
        //   shape: RoundedRectangleBorder(
        //     borderRadius: BorderRadius.circular(16),
        //   ),
        // ),
        filledButtonTheme: FilledButtonThemeData(
          style: FilledButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
          ),
        ),
        chipTheme: ChipThemeData(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
        ),
      ),
      home:  MyHomePage(),
    );
  }
}

