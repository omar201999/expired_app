import 'package:expired_app/data/model/product_model.dart';
import 'package:expired_app/presentation/widgets/regular_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

import '../styles/colors.dart';
import 'medium_text.dart';

class BuildProductItem extends StatelessWidget {
  final ProductModel productModel;
  const BuildProductItem({Key? key,required this.productModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
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
              percent: (formatDate(productModel.expireData!).difference(DateTime.now())).inDays / (formatDate(productModel.expireData!).difference(formatDate(productModel.createdAt!))).inDays > 1 ? 1 : (formatDate(productModel.expireData!).difference(DateTime.now())).inDays / (formatDate(productModel.expireData!).difference(formatDate(productModel.createdAt!))).inDays ,
              center: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children:
                [
                  RegularText(text: "${(formatDate(productModel.expireData!).difference(DateTime.now())).inDays}",color:  AppColor.primaryColor,fontSize: 12.sp,fontWeight: FontWeight.w400,),
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
                MediumText(text: productModel.productName!,fontSize: 16.sp,fontWeight: FontWeight.w500,color: AppColor.primaryColor,overflow: TextOverflow.ellipsis,maxLines: 2,),
                SizedBox(height: 5.h,),
                RegularText(text: productModel.expireData!,fontSize: 15.sp,fontWeight: FontWeight.w500,color: AppColor.primaryColor,overflow: TextOverflow.ellipsis,maxLines: 1,),
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
    );
  }

  DateTime formatDate(String date)
  {
    DateTime dateTime = DateTime.parse(date);
    return dateTime;
  }
}
