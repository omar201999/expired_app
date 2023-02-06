import 'package:expired_app/presentation/router/app_router_names.dart';
import 'package:expired_app/presentation/screens/user/add_product_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../styles/colors.dart';
import 'medium_text.dart';

class BuildCategoryItem extends StatelessWidget {
  final dynamic imageOfCategory;
  final String nameOfCategory;
  final bool imageOrNot;
  const BuildCategoryItem({Key? key,
    required this.imageOfCategory,
    required this.imageOrNot,
    required this.nameOfCategory
}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        Navigator.pushNamed(context, AppRouterNames.rProductsScreenRoute);
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

                    imageOrNot?Image(image:  AssetImage(imageOfCategory),color: AppColor.primaryColor,width: 24.w,height: 24.h,):Icon(imageOfCategory),
                    SizedBox(width: 8.w,),
                    MediumText(text: nameOfCategory,fontSize: 16.sp,fontWeight: FontWeight.w500,color: AppColor.primaryColor,)
                  ],
                ),
              ),
              IconButton(
                onPressed: (){},
                icon: const Icon(Icons.delete_forever),
                padding: EdgeInsets.zero,
              ),
            ],
          ),
        ),
      ),
    ) ;
  }
}
