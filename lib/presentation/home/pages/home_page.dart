import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../domain/repository/brand_repository.dart';
import '../../../domain/repository/product_repository.dart';
import '../../../domain/repository/product_slider_repository.dart';
import '../bloc/product_slider_bloc.dart';

class HomePage extends StatefulWidget {
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
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => ProductSliderBloc(
            repository: widget.productSliderRepository,
          )..add(const ProductSlidersRequested()),
        ),
        // Uncomment when needed
        // BlocProvider(
        //   create: (_) => ProductCubit(repository: widget.productRepository)
        //     ..loadProductsByBrand(1),
        // ),
      ],
      child: Scaffold(
       appBar: AppBar(
          title:  const Text("E commm App") ,
          backgroundColor: Colors.blue,
          foregroundColor: Colors.white,
          elevation: 0,

       ) ,
        body: RefreshIndicator( onRefresh: () {
           context.read<ProductSliderBloc>().add(
             const ProductSlidersRequested(),
           );
        },
          child:  SingleChildScrollView(
            physics: AlwaysScrollableScrollPhysics(),
            child: Column(
              children: [
                // Product slider
                BlocBuilder<ProductSliderBloc, ProductSliderState>(
                  builder: (context, state) {
                    if (state.status == ProductSliderStatus.failure) {
                      return SizedBox(
                        height: 200,
                        child: const Center(
                          child: CircularProgressIndicator(),
                        ),
                      );
                    }

                    if (state.status == ProductSliderStatus.failure) {
                      return const SizedBox.shrink();
                    }
                    if (state.sliders.isEmpty) {
                      return const SizedBox.shrink();
                    }
                    return Column(
                      children: [
                        SizedBox(
                          height: 200,
                          child: PageView.builder(
                              itemCount: state.sliders.length,
                              itemBuilder: (context, index) {
                                final slider = state.sliders[index];
                                return Container(
                                  margin: const EdgeInsets.all(8),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(12),
                                    image: slider.imageUrl.isNotEmpty
                                        ? DecorationImage(
                                      image: NetworkImage(slider.imageUrl),
                                      fit: BoxFit.cover,
                                    )
                                        : null,
                                    color: Colors.grey[300],
                                  ),
                                  child: slider.imageUrl.isEmpty
                                      ? const Center(
                                    child: Icon(
                                      Icons.image,
                                      size: 50,
                                      color: Colors.grey,
                                    ),
                                  )
                                      : null,
                                );


                              }),
                          ),
                         const SizedBox(height: 16),
                      ],
                    );
                  },
                ),
              ],
            ),


          ),
        ),
      ),
    );
  }
}