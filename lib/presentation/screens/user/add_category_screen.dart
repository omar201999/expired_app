import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../constants/assets_manager.dart';
import '../../styles/icon_broken.dart';
import '../../widgets/build_categorie_item.dart';
import '../../widgets/headline_text.dart';
import '../../widgets/my_button.dart';
import '../../widgets/my_form_field.dart';
import '../../widgets/regular_text.dart';

class AddCategoryScreen extends StatelessWidget {
  AddCategoryScreen({Key? key}) : super(key: key);

  var newCategoryNameController = TextEditingController();
  var formKey = GlobalKey<FormState>();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
        title:const HeadLineText(text:'New Category',fontSize: 24,),
        leading: IconButton(
          onPressed: (){
            Navigator.pop(context);
          },
          icon: const Icon(IconBroken.Arrow___Left_2),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Form(
            key: formKey,
            child: Padding(
              padding:  EdgeInsets.all(18.r),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children:
                [
                  MyFormField(
                    prefix: Icons.category_outlined,
                    hintText: 'Category Name',
                    borderColor:  const Color(0xffE5E5E5),
                    controller: newCategoryNameController,
                    validateText:'this files must not be empty',
                    maxLines: 1,

                    inputType: TextInputType.name,
                  ),
                  SizedBox(
                    height: 25.h,
                  ),
                  MyButton(
                    onPressed: () {
                      if (formKey.currentState!.validate()) {
                      }
                    },
                    text: 'Add',
                    isUpper: false,
                    //borderRadius: 18.r,
                  ),
                  SizedBox(
                    height: 25.h,
                  ),

                  RegularText(text: 'Suggestion Categories',fontSize: 18.sp,fontWeight: FontWeight.w500,),
                  SizedBox(
                    height: 25.h,
                  ),
                  ListView.separated(
                    physics: const NeverScrollableScrollPhysics(),
                    padding: EdgeInsets.zero,
                    shrinkWrap: true,
                    itemBuilder: (context,index) => BuildCategoryItem(imageOfCategory: imagesOfCategories[index], nameOfCategory: namesOfCategories[index], imageOrNot: imageOrNot[index],isFromAddCategory: true,newCategoryNameController: newCategoryNameController),
                    separatorBuilder: (context,index) => SizedBox(height: 10.h,),
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
  List<String> namesOfCategories=[
    'Fruits',
    'Vegetables',
    'Medicine',
    'Beverages',
    'Food grains & Oils',
    'Bakery, Cakes & Dairy',
    'Eggs, Meat & Fish',
    'Makeup',
  ];
  List<bool> imageOrNot=[
    true,
    true,
    false,
    false,
    false,
    false,
    false,
    true,
  ];
  List<dynamic> imagesOfCategories=[
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
