part of 'category_cubit.dart';

@immutable
abstract class CategoryState {}

class CategoryInitial extends CategoryState {}

class AddNewCategoryLoadingState extends CategoryState {}

class AddNewCategorySuccessState extends CategoryState {}

class AddNewCategoryErrorState extends CategoryState
{
  final String error;
  AddNewCategoryErrorState(this.error);
}

class UpdateCategoryLoadingState extends CategoryState {}

class UpdateCategorySuccessState extends CategoryState {}

class UpdateCategoryErrorState extends CategoryState
{
  final String error;
  UpdateCategoryErrorState(this.error);
}

class DeleteCategoryLoadingState extends CategoryState {}

class DeleteCategorySuccessState extends CategoryState {}

class DeleteCategoryErrorState extends CategoryState
{
  final String error;
  DeleteCategoryErrorState(this.error);
}

class GetAllCategoriesLoadingState extends CategoryState {}

class GetAllCategoriesSuccessState extends CategoryState {}

class GetAllCategoriesErrorState extends CategoryState
{
  final String error;
  GetAllCategoriesErrorState(this.error);
}

