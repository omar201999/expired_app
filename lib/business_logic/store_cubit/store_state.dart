part of 'store_cubit.dart';

@immutable
abstract class StoreState {}

class StoreInitial extends StoreState {}

class AddNewStoreLoadingState extends StoreState {}

class AddNewStoreSuccessState extends StoreState {}

class AddNewStoreErrorState extends StoreState
{
  final String error;
  AddNewStoreErrorState(this.error);
}

class UpdateStoreLoadingState extends StoreState {}

class UpdateStoreSuccessState extends StoreState {}

class UpdateStoreErrorState extends StoreState
{
  final String error;
  UpdateStoreErrorState(this.error);
}

class DeleteStoreLoadingState extends StoreState {}

class DeleteStoreSuccessState extends StoreState {}

class DeleteStoreErrorState extends StoreState
{
  final String error;
  DeleteStoreErrorState(this.error);
}

class GetAllStoresLoadingState extends StoreState {}

class GetAllStoresSuccessState extends StoreState {}

class GetAllStoresErrorState extends StoreState
{
  final String error;
  GetAllStoresErrorState(this.error);
}
