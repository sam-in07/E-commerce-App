import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';


import '../../../domain/models/category.dart';
import '../../../domain/repository/category_repository.dart';

part 'category_state.dart';

class CategoryCubit extends Cubit<CategoryState> {
  CategoryCubit({required this.repository}) : super(const CategoryState.initial());
  //Repository Obj create .....composition
  final CategoryRepository repository;
 //Api calling
  Future<void> loadCategories() async {
    emit(state.copyWith(status: CategoryStatus.loading));

    try {
      final categories = await repository.getCategories();
      emit(state.copyWith(status: CategoryStatus.success, categories: categories));
    }
    catch (e) {
      emit(
        state.copyWith(status: CategoryStatus.failure, errorMessage: e.toString()),
      );
    }
  }
}
