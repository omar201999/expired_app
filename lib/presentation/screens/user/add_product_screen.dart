import 'package:expired_app/business_logic/home_layout_cubit/home_layout_cubit.dart';
import 'package:expired_app/presentation/view/qrView.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';

import '../../styles/icon_broken.dart';
import '../../widgets/headline_text.dart';
import '../../widgets/my_button.dart';
import '../../widgets/my_form_field.dart';

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
                      suffixPressed: (){
                        Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) =>  BuildQRView(barcodeController: barcodeController,),
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
                        HomeLayoutCubit.get(context).pickDate(context)
                            .then((value) {
                          expiryDateController.text = DateFormat.yMMMd()
                              .format(HomeLayoutCubit.get(context).selectedDate);
                        });
                      },
                    ),
                    SizedBox(
                      height: 25.h,
                    ),
                    MyButton(
                      onPressed: () {
                        if (formKey.currentState!.validate()) {}
                      },
                      text: 'Add',
                      isUpper: false,
                      //borderRadius: 18.r,
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
