import 'package:expired_app/business_logic/product_cubit/product_cubit.dart';
import 'package:expired_app/core/constants/constants.dart';
import 'package:expired_app/data/model/product_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';

import '../../styles/colors.dart';
import '../../styles/icon_broken.dart';
import '../../view/qrView.dart';
import '../../widgets/headline_text.dart';
import '../../widgets/my_button.dart';
import '../../widgets/my_form_field.dart';
import '../../widgets/regular_text.dart';
import '../../widgets/show_toast.dart';

class EditProductScreen extends StatelessWidget {
  final ProductModel productModel;

  EditProductScreen({Key? key, required this.productModel}) : super(key: key);

  var productNameController = TextEditingController();
  var barcodeController = TextEditingController();
  var quantityController = TextEditingController();
  var priceController = TextEditingController();
  var categoryNameController = TextEditingController();
  var storeNameController = TextEditingController();
  var expiryDateController = TextEditingController();
  var daysToReminderBeforeExpireController = TextEditingController();
  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    productNameController.text = productModel.productName!;
    barcodeController.text = productModel.barCode!;
    quantityController.text = productModel.quantity!.toString();
    priceController.text = productModel.price!.toString();
    categoryNameController.text = productModel.category!.name!;
    storeNameController.text = productModel.market!.name!;
    expiryDateController.text =  DateFormat('yyyy-MM-dd hh:mm').format(formatDate(productModel.expireData!));
    daysToReminderBeforeExpireController.text = productModel.daysToReminderBeforeExpire!.toString();

    return Scaffold(
      appBar: AppBar(
        title: const HeadLineText(
          text: 'Edit Product',
          fontSize: 24,
        ),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(IconBroken.Arrow___Left_2),
        ),
      ),
      body: Center(
        child: SafeArea(
          child: SingleChildScrollView(
            child: Form(
              key: formKey,
              child: Padding(
                padding: EdgeInsets.all(16.r),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    MyFormField(
                      hintText: 'Product Name',
                      labelText: 'Product Name',
                      borderColor: const Color(0xffE5E5E5),
                      controller: productNameController,
                      validateText: 'Product Name must not be empty',
                      maxLines: 1,
                      inputType: TextInputType.name,
                    ),
                    SizedBox(
                      height: 25.h,
                    ),
                    MyFormField(
                      suffix: Icons.qr_code_2_sharp,
                      hintText: 'Barcode',
                      labelText: 'Barcode',
                      borderColor: const Color(0xffE5E5E5),
                      controller: barcodeController,
                      validateText: 'Barcode must not be empty',
                      maxLines: 1,
                      readOnly: true,
                      suffixPressed: () {
                        Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => BuildQRView(
                            barcodeController: barcodeController,
                          ),
                        ));
                      },
                      inputType: TextInputType.number,
                    ),
                    SizedBox(
                      height: 25.h,
                    ),
                    MyFormField(
                      //prefix: Icons.storefront_outlined,
                      hintText: 'Quantity',
                      labelText: 'Quantity',
                      borderColor: const Color(0xffE5E5E5),
                      controller: quantityController,
                      validateText: 'Quantity must not be empty',
                      maxLines: 1,
                      inputType: TextInputType.number,
                    ),
                    SizedBox(
                      height: 25.h,
                    ),
                    MyFormField(
                      //prefix: Icons.storefront_outlined,
                      hintText: 'Price',
                      labelText: 'Price',
                      borderColor: const Color(0xffE5E5E5),
                      controller: priceController,
                      validateText: 'price must not be empty',
                      maxLines: 1,
                      inputType: TextInputType.number,
                    ),
                    SizedBox(
                      height: 25.h,
                    ),
                    MyFormField(
                      // prefix: Icons.storefront_outlined,
                      hintText: 'Category Name',
                      labelText: 'Category Name',
                      readOnly: true,
                      borderColor: const Color(0xffE5E5E5),
                      controller: categoryNameController,
                      validateText: 'category files must not be empty',
                      maxLines: 1,
                      inputType: TextInputType.name,
                    ),
                    SizedBox(
                      height: 25.h,
                    ),
                    MyFormField(
                      // prefix: Icons.storefront_outlined,
                      hintText: 'Store Name',
                      labelText: 'Store Name',
                      readOnly: true,
                      borderColor: const Color(0xffE5E5E5),
                      controller: storeNameController,
                      validateText: 'Store files must not be empty',
                      maxLines: 1,
                      inputType: TextInputType.name,
                    ),
                    SizedBox(
                      height: 25.h,
                    ),
                    MyFormField(
                      prefix: IconBroken.Calendar,
                      hintText: 'Expiry Date',
                      labelText: 'Expiry Date',
                      borderColor: const Color(0xffE5E5E5),
                      controller: expiryDateController,
                      validateText: 'Expiry Date files must not be empty',
                      maxLines: 1,
                      readOnly: true,
                      inputType: TextInputType.datetime,
                      onTap: () {
                        ProductCubit.get(context)
                            .pickDate(context)
                            .then((value) {
                          expiryDateController.text = DateFormat('yyyy-MM-dd hh:mm').format(ProductCubit.get(context).selectedDate);
                        });
                      },
                    ),
                    SizedBox(
                      height: 25.h,
                    ),
                    RegularText(
                      text:
                          'Do you want to update days to be reminded before a Product expires?\nNote:The days number of reminded this product is ${productModel.daysToReminderBeforeExpire}',
                      fontSize: 18.sp,
                      fontWeight: FontWeight.w500,
                      maxLines: 6,
                      lineHeight: 1.5,
                      //overflow: TextOverflow.ellipsis,
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    MyFormField(
                      prefix: Icons.view_day,
                      hintText: 'Days To Reminder Before Expire',
                      labelText: 'Days To Reminder Before Expire',
                      borderColor: const Color(0xffE5E5E5),
                      controller: daysToReminderBeforeExpireController,
                      validateText: 'this files must not be empty',
                      maxLines: 1,
                      inputType: TextInputType.number,
                      inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                    ),
                    SizedBox(
                      height: 25.h,
                    ),
                    BlocConsumer<ProductCubit, ProductState>(
                      listener: (context, state) {
                        if (state is UpdateProductSuccessState) {
                          showToast(
                              text: 'Product updated Successfully ',
                              state: ToastStates.SUCCESS);
                          Navigator.pop(context);
                        } else if (state is UpdateProductErrorState) {
                          showToast(
                              text: state.error, state: ToastStates.ERROR);
                        }
                      },
                      builder: (context, state) {
                        return state is UpdateProductLoadingState
                            ? const Center(
                                child: CircularProgressIndicator(
                                  color: AppColor.primaryColor,
                                ),
                              )
                            : MyButton(
                                onPressed: () {
                                  if (formKey.currentState!.validate()) {
                                    ProductCubit.get(context).updateProduct(
                                        productModel: ProductModel(
                                      productId: productModel.productId,
                                      productName: productNameController.text,
                                      barCode: barcodeController.text,
                                      price: num.parse(priceController.text),
                                      currencyCode: productModel.currencyCode,
                                      quantity:
                                          num.parse(quantityController.text),
                                      createdAt: productModel.createdAt,
                                      expireData: expiryDateController.text,
                                      daysToReminderBeforeExpire: int.parse(
                                          daysToReminderBeforeExpireController
                                              .text),
                                      categoryId: productModel.categoryId,
                                      marketId: productModel.marketId,
                                      sellerId: userId,
                                    ));
                                  }
                                },
                                text: 'Edit',
                                isUpper: false,
                                //borderRadius: 18.r,
                              );
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
  DateTime formatDate(String date)
  {

    DateTime dateTime = DateTime.parse(date);
    return dateTime;
  }
}
