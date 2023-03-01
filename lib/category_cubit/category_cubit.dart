import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

import '../core/constants/assets_manager.dart';
import '../core/constants/constants.dart';
import '../core/constants/end_points.dart';
import '../data/model/category_model.dart';
import '../data/remote/web_service.dart';

part 'category_state.dart';

class CategoryCubit extends Cubit<CategoryState> {
  CategoryCubit() : super(CategoryInitial());
  static CategoryCubit get(context) => BlocProvider.of(context);

  Future addNewCategory({
    required String categoryName,
    required int marketId,
  })
  async{
    emit(AddNewCategoryLoadingState());
    await WebService().publicDio.post(
        addCategoryEndPoint,
        data: {
          "sellerId": userId,
          "dayesToReminderBeforExpire": 0,
          "marketId": marketId,
          "name": categoryName
        }).then((value) {
      getAllCategories(marketId: marketId);
      emit(AddNewCategorySuccessState());
    }).catchError((error){
      emit(AddNewCategoryErrorState(error.toString()));
      debugPrint(error.toString());
    });
  }
  Future updateCategory({
    required String newCategoryName,
    required int categoryId,
    required int marketId,

  })
  async{
    emit(UpdateCategoryLoadingState());
    await WebService().publicDio.put(
        updateCategoryEndPoint,
        data: {
          "sellerId": userId,
          "name": newCategoryName,
          "id":categoryId,
          "dayesToReminderBeforExpire": 0,
        }).then((value) {
      getAllCategories(marketId: marketId);
      emit(UpdateCategorySuccessState());
    }).catchError((error){
      emit(UpdateCategoryErrorState(error.toString()));
      debugPrint(error.toString());
    });
  }
  Future deleteCategory({
    required int categoryId,
    required int marketId,

  })
  async{
    await WebService().publicDio.delete(
        deleteCategoryEndPoint,
        data: {
          "sellerId": userId,
          "id":categoryId,
        }).then((value) {
      getAllCategories(marketId: marketId);
    }).catchError((error){
      emit(DeleteCategoryErrorState(error.toString()));
      debugPrint(error.toString());
    });
  }

  List<dynamic>? allCategories;
  Future getAllCategories({
 required int marketId,
})
  async{
    emit(GetAllCategoriesLoadingState());
    await WebService().publicDio.get(
        getAllCategoriesOfStoreEndPoint,
        queryParameters: {
          "marketId":marketId,
        }).then((value) {
      allCategories = value.data.map((store) => CategoryModel.fromJson(store)).toList();
      emit(GetAllCategoriesSuccessState());
    }).catchError((error){
      GetAllCategoriesErrorState(error.toString());
      debugPrint(error.toString());
    });
  }

  dynamic imagesOfCategories(String namesOfCategory)
  {

    namesOfCategory = namesOfCategory.toLowerCase().replaceAll(' ','');

    switch(namesOfCategory)
    {
      case 'fruits':
        return AssetsManager.fruitsImage;
      case 'vegetables':
        return AssetsManager.groceriesImage;
      case 'medicine':
        return Icons.medical_services_outlined;
      case 'beverages':
        return Icons.emoji_food_beverage_outlined;
      case 'foodgrains&oils':
        return Icons.grain;
      case 'bakery,cakes&dairy':
        return Icons.cake_outlined;
      case 'eggs,meat&fish':
        return  Icons.egg_outlined;
      case 'makeup':
        return  AssetsManager.makeupImage;
      default:
        return Icons.storefront_outlined;
    }
  }
  List<bool> imageOrNothgh = [
    true,
    true,
    false,
    false,
    false,
    false,
    false,
    true,
  ];
  bool imageOrNot(String namesOfCategory)
  {

    namesOfCategory = namesOfCategory.toLowerCase().replaceAll(' ','');

    switch(namesOfCategory)
    {
      case 'fruits':
        return true;
      case 'vegetables':
        return true;
      case 'medicine':
        return false;
      case 'beverages':
        return false ;
      case 'foodgrains&Oils':
        return false;
      case 'bakery,cakes&dairy':
        return false;
      case 'eggs,meat&fish':
        return false;
      case 'makeup':
        return false;
      default:
        return false;
    }
  }

}
