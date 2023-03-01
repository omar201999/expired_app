import 'dart:io';

import 'package:expired_app/business_logic/store_cubit/store_cubit.dart';
import 'package:expired_app/data/repository/global/global_repository.dart';
import 'package:expired_app/presentation/screens/user/home_screen.dart';
import 'package:expired_app/presentation/screens/user/stores_screen.dart';
import 'package:expired_app/presentation/styles/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'global_state.dart';

class GlobalCubit extends Cubit<GlobalState> {
  Locale locale = const Locale("en");
  ThemeMode appMode = ThemeMode.light;
  bool isDark = false;
  bool isEng = true;
  bool firstUse = false;
  final GlobalRepository globalRepository;

  GlobalCubit({required this.globalRepository}) : super(GlobalInitialState());

  static GlobalCubit get(context) => BlocProvider.of(context);
  Color cardColor = AppColor.white;
  Color colorOfFormField = AppColor.grey;
  Color backGroundOfToggleTap = AppColor.lightGrey;
  Color regularTextColor = AppColor.grey;
  Color headLineTextColor = AppColor.white;
  Color mediumTextColor = AppColor.white;

  Future<void> initApp() async {
    firstUse = await globalRepository.appFirstUse();
    final sysIsDark = _getSysThemeMode();
    final sysLocale = _getSysLocale();
    final myIsDark = await globalRepository.isDarkMode();
    final myLocale = await globalRepository.appLang();
    isDark = myIsDark ?? sysIsDark;
    locale = myLocale ?? sysLocale;
    isEng = locale.languageCode == 'en';
    await _updateAppLocale();
    _updateCurrentMode();
    await _updateAppMode();
  }

  Locale _getSysLocale() {
    final sysLocalName = Platform.localeName;
    if (sysLocalName.contains('ar')) {
      return const Locale('ar', 'EG');
    }
    return const Locale('en', 'US');
  }

  bool _getSysThemeMode() {
    final sysThemeMode = SchedulerBinding.instance.window.platformBrightness;
    if (sysThemeMode == Brightness.light) {
      return false;
    }
    return true;
  }

  Future<void> changeAppLocale() async {
    locale = locale == const Locale('ar', 'EG')
        ? const Locale('en', 'US')
        : const Locale('ar', 'EG');
    isEng = locale.languageCode == 'en';
    await _updateAppLocale();
  }

  Future _updateAppLocale() async {
    final result = await globalRepository.saveLang(locale: locale.languageCode);
    result.fold((l) {
      emit(AppLocaleSaveErrorState(l));
    }, (r) {
      emit(AppLocaleSavedState());
    });
  }

  void _updateCurrentMode() {
    if (isDark) {
      cardColor = AppColor.black;
      colorOfFormField = Colors.grey.shade900;
      backGroundOfToggleTap = AppColor.black;
      regularTextColor = AppColor.lightGrey;
      headLineTextColor = AppColor.white;
      mediumTextColor = AppColor.white;
      appMode = ThemeMode.dark;
      emit(AppChangeModeDarkState());
    } else {
      cardColor = AppColor.white;
      backGroundOfToggleTap = AppColor.lightGrey;
      regularTextColor = AppColor.grey;
      headLineTextColor = AppColor.black;
      mediumTextColor = AppColor.black;
      colorOfFormField = AppColor.lightGrey;
      appMode = ThemeMode.light;
      emit(AppChangeModeLightState());
    }
  }

  Future<void> changeAppMode() async {
    isDark = !isDark;
    _updateCurrentMode();
    await _updateAppMode();
  }

  Future _updateAppMode() async {
    final result = await globalRepository.saveMode(isDark: isDark);
    result.fold((l) {
      emit(AppModeSaveErrorState(l));
    }, (r) {
      emit(AppModeSavedState());
    });
  }


  // List<Widget> screens = [
  //   const HomeScreen(),
  //   const BookingScreen(),
  //   const ProfileScreen(),
  // ];

  onLogoutReset() {
    currentIndex = 0;
    emit(ChangeNavBarState());
  }

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
