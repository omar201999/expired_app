part of 'home_layout_cubit.dart';

@immutable
abstract class HomeLayoutState {}

class HomeLayoutInitial extends HomeLayoutState {}

class ChangeNavBarState extends HomeLayoutState {}

class SelectedDateState extends HomeLayoutState {}
