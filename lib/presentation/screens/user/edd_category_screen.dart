import 'package:expired_app/category_cubit/category_cubit.dart';
import 'package:expired_app/data/model/category_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../styles/colors.dart';
import '../../styles/icon_broken.dart';
import '../../widgets/headline_text.dart';
import '../../widgets/my_button.dart';
import '../../widgets/my_form_field.dart';
import '../../widgets/show_toast.dart';

class EditCategoryScreen extends StatelessWidget {
  final CategoryModel categoryModel;
  EditCategoryScreen({Key? key,required this.categoryModel}) : super(key: key);
  var newCategoryNameController = TextEditingController();
  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CategoryCubit, CategoryState>(
        builder: (context, state) {
          newCategoryNameController.text = categoryModel.name!;
          return Scaffold(
            appBar: AppBar(
              title: const HeadLineText(
                text: 'Edit Category',
                fontSize: 24,
              ),
              leading: IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: const Icon(IconBroken.Arrow___Left_2),
              ),
            ),
            body: SafeArea(
              child: SingleChildScrollView(
                child: Form(
                  key: formKey,
                  child: Padding(
                    padding: EdgeInsets.all(16.r),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        MyFormField(
                          prefix: Icons.storefront_outlined,
                          hintText: 'New Category Name',
                          labelText: 'New Category Name',
                          borderColor: const Color(0xffE5E5E5),
                          controller: newCategoryNameController,
                          validateText: 'this files must not be empty',
                          maxLines: 1,
                          autofocus: true,
                          inputType: TextInputType.name,
                        ),
                        SizedBox(
                          height: 25.h,
                        ),
                        state is UpdateCategoryLoadingState
                            ? const Center(
                          child: CircularProgressIndicator(
                            color: AppColor.primaryColor,
                          ),
                        )
                            : MyButton(
                          onPressed: () {
                            if (formKey.currentState!.validate()) {
                              CategoryCubit.get(context).updateCategory(
                                marketId: categoryModel.marketId!,
                                categoryId: categoryModel.categoryId!,
                                newCategoryName:newCategoryNameController.text
                              );
                            }
                          },
                          text: 'Update',
                          isUpper: false,
                          //borderRadius: 18.r,
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
        },
        listener: (context, state) {
          if (state is UpdateCategorySuccessState) {
            showToast(text: 'Category updated Successfully ', state: ToastStates.SUCCESS);
            Navigator.pop(context);
          } else if (state is UpdateCategoryErrorState) {
            showToast(text: state.error, state: ToastStates.ERROR);
          }
        }
        );
  }
}
