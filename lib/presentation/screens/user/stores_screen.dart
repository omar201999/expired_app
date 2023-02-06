import 'package:expired_app/presentation/router/app_router_names.dart';
import 'package:expired_app/presentation/styles/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../widgets/medium_text.dart';

class StoresScreen extends StatelessWidget {
  const StoresScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      physics: const BouncingScrollPhysics(),
        padding: EdgeInsets.zero,
        shrinkWrap: true,
        itemBuilder: (context,index) => InkWell(
          onTap: (){
            Navigator.pushNamed(context, AppRouterNames.rCategoriesScreenRoute);
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
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children:
                      [
                        MediumText(text: 'Store Name',fontSize: 16.sp,fontWeight: FontWeight.w500,color: AppColor.primaryColor,)
                      ],
                    ),
                  ),
                  IconButton(
                    onPressed: (){},
                    icon: const Icon(Icons.delete_forever),
                    padding: EdgeInsets.zero,
                    color: AppColor.primaryColor,
                  ),
                ],
              ),
            ),
          ),
        ) ,
        separatorBuilder: (context,index) => SizedBox(height: 10.h,),
        itemCount: 15,
    );
  }
}
