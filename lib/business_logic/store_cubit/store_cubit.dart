
import 'package:bloc/bloc.dart';
import 'package:expired_app/data/model/store_model.dart';
import 'package:expired_app/data/remote/web_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

import '../../core/constants/constants.dart';
import '../../core/constants/end_points.dart';

part 'store_state.dart';

class StoreCubit extends Cubit<StoreState> {
  StoreCubit() : super(StoreInitial());

  static StoreCubit get(context) => BlocProvider.of(context);


  Future addNewStore({
    required String storeName,
  })
  async{
    emit(AddNewStoreLoadingState());
    await WebService().publicDio.post(
        addStoreEndPoint,
        data: {
          "sellerId": userId,
          "name": storeName
        }).then((value) {
          getAllStores();
          emit(AddNewStoreSuccessState());
    }).catchError((error){
      emit(AddNewStoreErrorState(error.toString()));
      debugPrint(error.toString());
    });
  }
  Future updateStore({
    required String newStoreName,
    required int marketId,
  })
  async{
    emit(UpdateStoreLoadingState());
    await WebService().publicDio.put(
        updateStoreEndPoint,
        data: {
          "sellerId": userId,
          "name": newStoreName,
          "marketId":marketId
        }).then((value) {
      getAllStores();
      emit(UpdateStoreSuccessState());
    }).catchError((error){
      emit(UpdateStoreErrorState(error.toString()));
      debugPrint(error.toString());
    });
  }
  Future deleteStore({
    required int marketId,
  })
  async{
    await WebService().publicDio.delete(
        deleteStoreEndPoint,
        data: {
          "sellerId": userId,
          "marketId":marketId
        }).then((value) {
      getAllStores();
    }).catchError((error){
      emit(DeleteStoreErrorState(error.toString()));
      debugPrint(error.toString());
    });
  }

  List<dynamic>? allStores;
  Future getAllStores()
  async{
    emit(GetAllStoresLoadingState());
    await WebService().publicDio.get(
        getAllStoresEndPoint,
        queryParameters: {
        "sellerId":userId,
      }).then((value) {
        allStores = value.data.map((store) => StoreModel.fromJson(store)).toList();

        emit(GetAllStoresSuccessState());
    }).catchError((error){
      GetAllStoresErrorState(error.toString());
      debugPrint(error.toString());
    });
  }
}
