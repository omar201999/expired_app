import 'package:expired_app/presentation/styles/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/local/cache_helper.dart';

part 'global_state.dart';

class GlobalCubit extends Cubit<GlobalState> {
  GlobalCubit() : super(GlobalInitial());

  static GlobalCubit get(context) => BlocProvider.of(context);

  // لو عاوز نعمل toggle ما بين dark & light هنزود الالوان هنا ونديها لكل widget زي card or container او اي حاجة ونديها لونها في الwidget وبعد كدا نظبطها هنا في الدارك واللايت
  Color cardColor = AppColor.white;


  bool isDark = false;

  void changeAppMode({bool? fromCache}) {
    if (fromCache != null) {
      isDark = fromCache;
    } else {
      isDark = !isDark;
    }
    CacheHelper.saveDataSharedPreference(key: 'isDark', value: isDark).then((value) {
      if (isDark) {
        cardColor = AppColor.darkGrey;
        emit(AppChangeModeDarkState());
      } else {
        cardColor = AppColor.white;
        emit(AppChangeModeLightState());
      }
    });
  }
}
