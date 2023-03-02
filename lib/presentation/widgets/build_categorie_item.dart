import 'package:expired_app/category_cubit/category_cubit.dart';
import 'package:expired_app/data/model/category_model.dart';
import 'package:expired_app/presentation/router/app_router_names.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../styles/colors.dart';
import 'medium_text.dart';

class BuildCategoryItem extends StatelessWidget {
  final dynamic imageOfCategory;
  final String? nameOfCategory;
  final bool? imageOrNot;
  final bool isFromAddCategory;
  final CategoryModel categoryModel;
  final TextEditingController? newCategoryNameController  ;
  final ScrollController? scrollController  ;
  const BuildCategoryItem({Key? key,
     this.imageOfCategory,
     this.imageOrNot,
     this.nameOfCategory,
    required this.categoryModel,
    this.isFromAddCategory = false,
   this.newCategoryNameController,
   this.scrollController
}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CategoryCubit, CategoryState>(
  builder: (context, state) {
    return InkWell(
      onTap: (){
        isFromAddCategory ? {newCategoryNameController!.text = nameOfCategory!, scrollController!.animateTo(0, duration: const Duration(milliseconds: 500), curve:Curves.fastOutSlowIn)} :Navigator.pushNamed(context, AppRouterNames.rProductsScreenRoute,arguments: categoryModel);
      },
      child: Container(
        height: 95.h,
        decoration: BoxDecoration(
          color:  const Color(0xfff7f2f9),
          borderRadius: BorderRadius.all(Radius.circular(12.r),),
          border: Border.all(color: const Color(0xffcac4d0),width: 1.w,style: BorderStyle.solid),
        ),
        child: Padding(
          padding: EdgeInsets.all(12.r),
          child: Row(
            children: [
              Expanded(
                child: Row(
                  children:
                  [

                    isFromAddCategory ? imageOrNot!?Image(image:  AssetImage(imageOfCategory),color: AppColor.primaryColor,width: 24.w,height: 24.h,):Icon(imageOfCategory) :CategoryCubit.get(context).imageOrNot(categoryModel.name!)?Image(image:  AssetImage(CategoryCubit.get(context).imagesOfCategories(categoryModel.name!)),color: AppColor.primaryColor,width: 24.w,height: 24.h,):Icon(CategoryCubit.get(context).imagesOfCategories(categoryModel.name!)),// CategoryCubit.get(context).imagesOfCategories(categoryModel.name!)
                    SizedBox(width: 8.w,),
                    MediumText(text:isFromAddCategory?nameOfCategory!:categoryModel.name! ,fontSize: 16.sp,fontWeight: FontWeight.w500,color: AppColor.primaryColor,)
                  ],
                ),
              ),
              isFromAddCategory ?const SizedBox():IconButton(
                onPressed: (){
                  Navigator.pushNamed(context, AppRouterNames.rEditCategoryScreenRoute,arguments: categoryModel);
                },
                icon: const Icon(Icons.edit_outlined),
                padding: EdgeInsets.zero,
                color: AppColor.primaryColor,
              ),
              isFromAddCategory ?const SizedBox():IconButton(
                onPressed: (){
                  CategoryCubit.get(context).deleteCategory(categoryId: categoryModel.categoryId!, marketId: categoryModel.marketId!);
                },
                icon: const Icon(Icons.delete_forever),
                padding: EdgeInsets.zero,
              ),
            ],
          ),
        ),
      ),
    );
  },
) ;
  }
}
