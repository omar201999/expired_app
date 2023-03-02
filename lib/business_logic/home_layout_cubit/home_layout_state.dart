part of 'home_layout_cubit.dart';

@immutable
abstract class HomeLayoutState {}

class HomeLayoutInitial extends HomeLayoutState {}

class ChangeNavBarState extends HomeLayoutState {}

class SelectedDateState extends HomeLayoutState {}


class GetProfileDataLoadingState extends HomeLayoutState {}
class GetProfileDataSuccessState extends HomeLayoutState {}
class GetProfileDataErrorState  extends HomeLayoutState {
  final String error;
  GetProfileDataErrorState(this.error);
}

class GetAllExpiryProductsLoadingState extends HomeLayoutState {}
class GetAllExpiryProductsSuccessState extends HomeLayoutState {}
class GetAllExpiryProductsErrorState  extends HomeLayoutState {
  final String error;
  GetAllExpiryProductsErrorState(this.error);
}
class GetReminderExpiryProductsLoadingState extends HomeLayoutState {}
class GetReminderExpiryProductsSuccessState extends HomeLayoutState {}
class GetReminderExpiryProductsErrorState  extends HomeLayoutState {
  final String error;
  GetReminderExpiryProductsErrorState(this.error);
}
