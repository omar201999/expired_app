import 'package:expired_app/presentation/styles/colors.dart';
import 'package:expired_app/presentation/widgets/medium_text.dart';
import 'package:expired_app/presentation/widgets/regular_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children:
        [
          MediumText(text: 'Hi, Omar Essam ',fontSize: 16.sp,fontWeight: FontWeight.w500,),
          SizedBox(height: 20.h,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                width: 100.w,
                height: 60.h,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(6.r)),
                  color: const Color(0xffE46962)
                ),
                child: Padding(
                  padding: EdgeInsets.all(10.r),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children:
                    [
                      RegularText(text: '2',fontSize: 12.sp,fontWeight: FontWeight.w500,color: AppColor.white),
                      SizedBox(height:5.h ,),
                      RegularText(text: 'Expiring Soon',fontSize: 12.sp,fontWeight: FontWeight.w500,color: AppColor.white),
                    ],
                  ),
                ),
              ),
              Container(
                width: 100.w,
                height: 60.h,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(6.r)),
                  color:  const Color(0xfff7f2f9)
                ),
                child: Padding(
                  padding: EdgeInsets.all(10.r),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children:
                    [
                      RegularText(text: '2',fontSize: 12.sp,fontWeight: FontWeight.w500,color: AppColor.black),
                      SizedBox(height:5.h ,),
                      RegularText(text: 'Good-To-Use',fontSize: 12.sp,fontWeight: FontWeight.w500,color: AppColor.black),
                    ],
                  ),
                ),
              ),
              Container(
                width: 100.w,
                height: 60.h,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(6.r)),
                    color:  const Color(0xfff7f2f9)
                ),
                child: Padding(
                  padding: EdgeInsets.all(10.r),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children:
                    [
                      RegularText(text: '2',fontSize: 12.sp,fontWeight: FontWeight.w500,color: AppColor.black),
                      SizedBox(height:5.h ,),
                      RegularText(text: 'Expiring Soon',fontSize: 12.sp,fontWeight: FontWeight.w500,color: AppColor.black),
                    ],
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 20.h,),
          Divider(
            thickness: 1.h,
            height: 1.h,
            color: const Color(0xffcac4d0),
          ),
          SizedBox(height: 25.h,),
          RegularText(text: 'Alerts',fontSize: 14.sp,fontWeight: FontWeight.w500,),
          SizedBox(height: 25.h,),
          SizedBox(
            height: 80.h,
            child: ListView.separated(
              physics: const BouncingScrollPhysics(),
                padding: EdgeInsets.zero,
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context,index) => Container(
                  height: 80.h,
                  width: 160.w,
                  decoration: BoxDecoration(
                    color: AppColor.buttonNavigationBarColor,
                    borderRadius: BorderRadius.all(Radius.circular(12.r),),
                    border: Border.all(color: const Color(0xffcac4d0),width: 1.w,style: BorderStyle.solid),
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(12.r),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children:
                      [
                        Row(
                          children: [
                            Expanded(child: MediumText(text: 'Expiring Soon',fontSize: 16.sp,fontWeight: FontWeight.w500,color: AppColor.black,)),
                            const Icon(Icons.error,color: Color(0xffE46962)),
                          ],
                        ),
                        SizedBox(height: 8.h),
                        RegularText(text: 'Fanta',fontSize: 14.sp,fontWeight: FontWeight.w400,color: AppColor.black,),
                      ],
                    ),
                  ),
                ) ,
                separatorBuilder: (context,index) => SizedBox(width: 10.w,),
                itemCount: 10,
            ),
          ),
        ],
      ),
    );
  }
}
