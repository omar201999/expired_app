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
        itemBuilder: (context,index) => Container(
          //width: MediaQuery.of(context).size.width,
          height: 95.h,
          decoration: BoxDecoration(
            color: AppColor.buttonNavigationBarColor,
            borderRadius: BorderRadius.all(Radius.circular(12.r),),
            border: Border.all(color: const Color(0xffcac4d0),width: 1.w,style: BorderStyle.solid),
          ),
          child: Padding(
            padding: EdgeInsets.all(12.r),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children:
              [
                MediumText(text: 'Store Name',fontSize: 16.sp,fontWeight: FontWeight.w500,color: AppColor.black,)
              ],
            ),
          ),
        ) ,
        separatorBuilder: (context,index) => SizedBox(height: 10.h,),
        itemCount: 15,
    );
  }
}
