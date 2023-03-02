import 'package:bloc/bloc.dart';
import 'package:expired_app/core/constants/constants.dart';
import 'package:expired_app/core/constants/end_points.dart';
import 'package:expired_app/data/model/expiry_products_model.dart';
import 'package:expired_app/data/model/user_model.dart';
import 'package:expired_app/data/remote/web_service.dart';
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
  UserModel? userModel;
  Future getProfileData()
  async{
    emit(GetProfileDataLoadingState());
    await WebService().publicDio.get(
        getProfileOfSellerEndPoint,
        queryParameters: {
      "sellerId":userId,
    }).then((value) {
      userModel=UserModel.fromJson(value.data);
      emit(GetProfileDataSuccessState());
    }).catchError((error){
      emit(GetProfileDataErrorState(error.toString()));
      debugPrint(error.toString());
    });
  }

  List<dynamic>? allExpiryProducts;
  Future getExpiryProducts()
  async{
    emit(GetAllExpiryProductsLoadingState());
    await WebService().publicDio.get(
        getAllExpiryProductsEndPoint,
        queryParameters: {
          "sellerId":userId,
        }).then((value) {
      allExpiryProducts = value.data.map((store) => ExpiryProductsModel.fromJson(store)).toList();
      emit(GetAllExpiryProductsSuccessState());
    }).catchError((error){
      emit(GetAllExpiryProductsErrorState(error.toString()));
      debugPrint(error.toString());
    });
  }
  List<dynamic>? allReminderExpiryProducts;
  Future getReminderExpiryProducts()
  async{
    emit(GetReminderExpiryProductsLoadingState());
    await WebService().publicDio.get(
        getReminderExpiryProductsEndPoint,
        queryParameters: {
          "sellerId":userId,
        }).then((value) {
      allReminderExpiryProducts = value.data.map((store) => ExpiryProductsModel.fromJson(store)).toList();
      emit(GetReminderExpiryProductsSuccessState());
    }).catchError((error){
      emit(GetReminderExpiryProductsErrorState(error.toString()));
      debugPrint(error.toString());
    });
  }
}
