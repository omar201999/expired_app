import 'package:expired_app/business_logic/product_cubit/product_cubit.dart';
import 'package:expired_app/core/constants/constants.dart';
import 'package:expired_app/data/model/product_model.dart';
import 'package:expired_app/presentation/view/qrView.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';

import '../../styles/colors.dart';
import '../../styles/icon_broken.dart';
import '../../widgets/headline_text.dart';
import '../../widgets/my_button.dart';
import '../../widgets/my_form_field.dart';
import '../../widgets/show_toast.dart';

class AddProductScreen extends StatelessWidget {
  AddProductScreen({Key? key}) : super(key: key);

  var productNameController = TextEditingController();
  var barcodeController = TextEditingController();
  var quantityController = TextEditingController();
  var priceController = TextEditingController();
  var categoryNameController = TextEditingController();
  var storeNameController = TextEditingController();
  var expiryDateController = TextEditingController();
  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const HeadLineText(
          text: 'New Product',
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
                      borderColor: const Color(0xffE5E5E5),
                      controller: categoryNameController,
                      validateText: 'category files must not be empty',
                      readOnly: true,
                      maxLines: 1,
                      inputType: TextInputType.name,
                    ),
                    SizedBox(
                      height: 25.h,
                    ),
                    MyFormField(
                      // prefix: Icons.storefront_outlined,
                      hintText: 'Store Name',
                      borderColor: const Color(0xffE5E5E5),
                      controller: storeNameController,
                      validateText: 'Store files must not be empty',
                      readOnly: true,
                      maxLines: 1,
                      inputType: TextInputType.name,
                    ),
                    SizedBox(
                      height: 25.h,
                    ),
                    MyFormField(
                      prefix: IconBroken.Calendar,
                      hintText: 'Expiry Date',
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
                          expiryDateController.text = DateFormat('yyyy-MM-dd hh:mm').format(
                              ProductCubit.get(context).selectedDate);
                        });
                      },
                    ),
                    SizedBox(
                      height: 25.h,
                    ),
                    BlocConsumer<ProductCubit, ProductState>(
                      listener: (context, state) {
                        if (state is AddNewProductSuccessState) {
                          showToast(
                              text: 'New Product added Successfully ',
                              state: ToastStates.SUCCESS);
                          Navigator.pop(context);
                        } else if (state is AddNewProductErrorState) {
                          showToast(text: state.error, state: ToastStates.ERROR);
                        }
                      },
                      builder: (context, state) {
                        return state is AddNewProductLoadingState
                            ? const Center(
                                child: CircularProgressIndicator(
                                  color: AppColor.primaryColor,
                                ),
                              )
                            : MyButton(
                                onPressed: () {
                                  //DateTime dateTime = DateTime.parse(expiryDateController.text);
                                 // expiryDateController.text=DateFormat('yyyy-mm-dd hh:mm:ss').format(dateTime);
                                    ProductCubit.get(context).addNewProduct(productModel: ProductModel(
                                      productName: productNameController.text,
                                      barCode: barcodeController.text,
                                      sellerId: userId,
                                      price: int.parse(priceController.text),
                                      quantity:int.parse(quantityController.text),
                                      categoryId: 6,
                                      marketId: 5,
                                      daysToReminderBeforeExpire: 0,
                                      expireData: expiryDateController.text,
                                      currencyCode:"784" ,
                                    ));

                                },
                                text: 'Add',
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
}
