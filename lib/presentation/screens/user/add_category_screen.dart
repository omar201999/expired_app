import 'package:expired_app/category_cubit/category_cubit.dart';
import 'package:expired_app/core/constants/assets_manager.dart';
import 'package:expired_app/data/model/category_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../styles/colors.dart';
import '../../styles/icon_broken.dart';
import '../../widgets/build_categorie_item.dart';
import '../../widgets/headline_text.dart';
import '../../widgets/my_button.dart';
import '../../widgets/my_form_field.dart';
import '../../widgets/regular_text.dart';
import '../../widgets/show_toast.dart';

class AddCategoryScreen extends StatelessWidget {
  AddCategoryScreen({Key? key, required this.marketId}) : super(key: key);
  final int marketId;

  var newCategoryNameController = TextEditingController();
  var formKey = GlobalKey<FormState>();
  ScrollController scrollController = ScrollController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const HeadLineText(
          text: 'New Category',
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
          physics: const BouncingScrollPhysics(),
          controller: scrollController,
          child: Form(
            key: formKey,
            child: Padding(
              padding: EdgeInsets.all(18.r),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  MyFormField(
                    prefix: Icons.add_box_outlined,
                    hintText: 'Category Name',
                    labelText: 'Category Name',
                    borderColor: const Color(0xffE5E5E5),
                    controller: newCategoryNameController,
                    validateText: 'this files must not be empty',
                    maxLines: 1,
                    inputType: TextInputType.name,
                  ),
                  SizedBox(
                    height: 25.h,
                  ),
                  BlocConsumer<CategoryCubit, CategoryState>(
                    listener: (context, state) {
                      if(state is AddNewCategorySuccessState)
                      {
                        showToast(text: 'New Category added Successfully ', state: ToastStates.SUCCESS);
                        Navigator.pop(context);
                      }
                      else if(state is AddNewCategoryErrorState)
                      {
                        showToast(text: state.error, state: ToastStates.ERROR);
                      }
                    },
                    builder: (context, state) {
                      return state is AddNewCategoryLoadingState
                          ? const Center(
                              child: CircularProgressIndicator(
                                color: AppColor.primaryColor,
                              ),
                            )
                          : MyButton(
                              onPressed: () {
                                if (formKey.currentState!.validate()) {
                                  CategoryCubit.get(context).addNewCategory(
                                      categoryName:
                                          newCategoryNameController.text,
                                      marketId: marketId);
                                }
                              },
                              text: 'Add',
                              isUpper: false,
                              //borderRadius: 18.r,
                            );
                    },
                  ),
                  SizedBox(
                    height: 25.h,
                  ),
                  RegularText(
                    text: 'Suggestion Categories',
                    fontSize: 18.sp,
                    fontWeight: FontWeight.w500,
                  ),
                  SizedBox(
                    height: 25.h,
                  ),
                  ListView.separated(
                    physics: const NeverScrollableScrollPhysics(),
                    padding: EdgeInsets.zero,
                    shrinkWrap: true,
                    itemBuilder: (context, index) => BuildCategoryItem(
                      imageOfCategory: imagesOfCategories[index],
                      nameOfCategory: namesOfCategories[index],
                      imageOrNot: imageOrNot[index],
                      isFromAddCategory: true,
                      newCategoryNameController: newCategoryNameController,
                      categoryModel: CategoryModel(),
                      scrollController: scrollController,
                    ),
                    separatorBuilder: (context, index) => SizedBox(
                      height: 10.h,
                    ),
                    itemCount: 8,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  List<String> namesOfCategories = [
    'Fruits',
    'Vegetables',
    'Medicine',
    'Beverages',
    'Food grains & Oils',
    'Bakery, Cakes & Dairy',
    'Eggs, Meat & Fish',
    'Makeup',
  ];
  List<bool> imageOrNot = [
    true,
    true,
    false,
    false,
    false,
    false,
    false,
    true,
  ];
  List<dynamic> imagesOfCategories = [
    AssetsManager.fruitsImage,
    AssetsManager.groceriesImage,
    Icons.medical_services_outlined,
    Icons.emoji_food_beverage_outlined,
    Icons.grain,
    Icons.cake_outlined,
    Icons.egg_outlined,
    AssetsManager.makeupImage,
  ];
}
