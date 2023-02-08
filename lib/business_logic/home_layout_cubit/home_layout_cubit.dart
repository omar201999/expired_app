import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

import '../../presentation/screens/user/home_screen.dart';
import '../../presentation/screens/user/stores_screen.dart';

part 'home_layout_state.dart';

class HomeLayoutCubit extends Cubit<HomeLayoutState> {
  HomeLayoutCubit() : super(HomeLayoutInitial());

  static HomeLayoutCubit get(context) => BlocProvider.of(context);

  List<Widget> screens = [
   const HomeScreen(),
   const StoresScreen(),
  ];

  List<String> titlesAppbar = ['Home', 'Stores'];

  int currentIndex = 0;

  void changeNavBar(index) {
    currentIndex = index;
    emit(ChangeNavBarState());
  }
  DateTime selectedDate = DateTime.now();

  pickDate(BuildContext context) async {
    DateTime? selected = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(1950),
      lastDate: DateTime.now(),
    );
    if (selected != null && selected != selectedDate) {
      selectedDate = selected;
      emit(SelectedDateState());
    }
  }
}
