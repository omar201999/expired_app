part of 'product_cubit.dart';

@immutable
abstract class ProductState {}

class ProductInitial extends ProductState {}

class AddNewProductLoadingState extends ProductState {}

class AddNewProductSuccessState extends ProductState {}

class AddNewProductErrorState extends ProductState
{
  final String error;
  AddNewProductErrorState(this.error);
}

class UpdateProductLoadingState extends ProductState {}

class UpdateProductSuccessState extends ProductState {}

class UpdateProductErrorState extends ProductState
{
  final String error;
  UpdateProductErrorState(this.error);
}

class DeleteProductLoadingState extends ProductState {}

class DeleteProductSuccessState extends ProductState {}

class DeleteProductErrorState extends ProductState
{
  final String error;
  DeleteProductErrorState(this.error);
}

class GetAllProductsLoadingState extends ProductState {}

class GetAllProductsSuccessState extends ProductState {}

class GetAllProductsErrorState extends ProductState
{
  final String error;
  GetAllProductsErrorState(this.error);
}
class SelectedDateState extends ProductState
{

}

