import 'package:expired_app/presentation/widgets/regular_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

import '../../router/app_router_names.dart';
import '../../styles/colors.dart';
import '../../styles/icon_broken.dart';
import '../../widgets/headline_text.dart';
import '../../widgets/medium_text.dart';

class ProductsScreen extends StatelessWidget {
  const ProductsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton:InkWell(
        onTap: (){
          Navigator.pushNamed(context, AppRouterNames.rAddProductScreenRoute);
        },
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(15.r)),
            color: const Color(0xFFEBDDFF),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 3,
                blurRadius: 7,
                offset: const Offset(3, 0), // changes position of shadow
              ),
            ],
          ),

          height: 60.h,
          width: 60.w,
          child: const Center(
            child: Icon(Icons.add,color: AppColor.black,size:40 ),
          ),
        ),
      ),
      appBar:AppBar(
        title:const HeadLineText(text:'Products',fontSize: 24,),
        leading: IconButton(
          onPressed: (){
            Navigator.pop(context);
          },
          icon: const Icon(IconBroken.Arrow___Left_2),
        ),
      ),
      body: SafeArea(
        child: ListView.separated(
          physics: const BouncingScrollPhysics(),
          padding: EdgeInsets.all(18.r),
          shrinkWrap: true,
          itemBuilder: (context,index) => InkWell(
            onTap: (){
              Navigator.pushNamed(context, AppRouterNames.rEditProductScreenRoute);
            },
            child: Container(
              height: 95.h,
              decoration: BoxDecoration(
                color:  const Color(0xfff7f2f9),
                borderRadius: BorderRadius.all(Radius.circular(12.r),),
                border: Border.all(color: const Color(0xffcac4d0),width: 1.w,style: BorderStyle.solid),
              ),
              child: Padding(
                padding: EdgeInsets.all(14.r),
                child: Row(
                  children: [
                    CircularPercentIndicator(
                      radius: 30.r,
                      animation: true,
                      animationDuration: 1000,
                      lineWidth: 2.w,
                      percent: 0.8,
                      center: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children:
                        [
                          RegularText(text: '10',color:  AppColor.primaryColor,fontSize: 12.sp,fontWeight: FontWeight.w400,),
                          SizedBox(height: 5.h,),
                          RegularText(text: 'days',color:  AppColor.primaryColor,fontSize: 12.sp,fontWeight: FontWeight.w400,),
                        ],
                      ),
                      circularStrokeCap: CircularStrokeCap.butt,
                      backgroundColor:AppColor.white,
                      progressColor: AppColor.primaryColor,
                    ),
                    SizedBox(width: 20.w,),
                    Expanded(child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children:
                      [
                        MediumText(text: 'product Name',fontSize: 16.sp,fontWeight: FontWeight.w500,color: AppColor.primaryColor,overflow: TextOverflow.ellipsis,maxLines: 2,),
                        SizedBox(height: 5.h,),
                        RegularText(text: 'Expiry Date',fontSize: 15.sp,fontWeight: FontWeight.w500,color: AppColor.primaryColor,overflow: TextOverflow.ellipsis,maxLines: 1,),
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
          ),
          separatorBuilder: (context,index) => SizedBox(height: 10.h,),
          itemCount: 8,
        ),
      ),
    );
  }
}
