import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

import '../../core/constants/constants.dart';
import '../../core/constants/end_points.dart';
import '../../data/model/product_model.dart';
import '../../data/remote/web_service.dart';

part 'product_state.dart';

class ProductCubit extends Cubit<ProductState> {
  ProductCubit() : super(ProductInitial());


  static ProductCubit get(context) => BlocProvider.of(context);


  Future addNewProduct({
   required ProductModel productModel
  })
  async{
    emit(AddNewProductLoadingState());
    await WebService().publicDio.post(
        addProductEndPoint,
        data: productModel.toJsonForAdd()
    ).then((value) {
      getAllProducts(marketId: productModel.marketId!);
      emit(AddNewProductSuccessState());
    }).catchError((error){
      emit(AddNewProductErrorState(error.toString()));
      debugPrint(error.toString());
    });
  }
  Future updateProduct({
    required ProductModel productModel
  })
  async{
    emit(UpdateProductLoadingState());
    await WebService().publicDio.put(
        updateProductEndPoint,
        data:productModel.toJsonForEdit()
    ).then((value) {
      getAllProducts(marketId: productModel.marketId!);
      emit(UpdateProductSuccessState());
    }).catchError((error){
      emit(UpdateProductErrorState(error.toString()));
      debugPrint(error.toString());
    });
  }
  Future deleteProduct({
    required int productId,
    required int marketId,
  })
  async{
    await WebService().publicDio.delete(
        deleteProductEndPoint,
        data: {
          "id":productId,
          "sellerId": userId,
        }).then((value) {
      getAllProducts(marketId: marketId);
    }).catchError((error){
      emit(DeleteProductErrorState(error.toString()));
      debugPrint(error.toString());
    });
  }

  List<dynamic>? allProducts;
  Future getAllProducts({
  required int marketId,
})
  async{
    emit(GetAllProductsLoadingState());
    await WebService().publicDio.get(
        getAllProductsOfStoreEndPoint,
        queryParameters: {
          "marketId":marketId,
        }).then((value) {
      allProducts = value.data.map((store) => ProductModel.fromJson(store)).toList();
      emit(GetAllProductsSuccessState());
    }).catchError((error){
      GetAllProductsErrorState(error.toString());
      debugPrint(error.toString());
    });
  }
  DateTime selectedDate = DateTime.now();

  pickDate(BuildContext context) async {
    DateTime? selected = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime.now(),
      lastDate: DateTime(2050),
    );
    if (selected != null && selected != selectedDate) {
      selectedDate = selected;
      emit(SelectedDateState());
    }
  }

}
