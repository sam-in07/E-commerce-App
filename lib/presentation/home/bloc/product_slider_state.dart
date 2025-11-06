
//import 'package:equatable/equatable.dart';

//import '../../../domain/models/product_slider.dart';

part of 'product_slider_bloc.dart';
enum ProductSliderStatus { initial, loading, success, failure }

class ProductSliderState extends Equatable {
  final ProductSliderStatus status;
  final List<ProductSlider> sliders;
  final String? errorMessage;
  const ProductSliderState({
    required this.status,
    required this.sliders,
    this.errorMessage,
  });

  const ProductSliderState.initial()
      : status = ProductSliderStatus.initial,
        sliders = const [],
        errorMessage = null;

  ProductSliderState copyWith({
    ProductSliderStatus? status,
    List<ProductSlider>? sliders,
    String? errorMessage,
  }) {
    return ProductSliderState(
      status: status ?? this.status,
      sliders: sliders ?? this.sliders,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }

  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();

}