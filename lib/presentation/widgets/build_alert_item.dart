import 'package:expired_app/data/model/expiry_products_model.dart';
import 'package:expired_app/presentation/widgets/regular_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../styles/colors.dart';
import 'medium_text.dart';

class BuildAlertItem extends StatelessWidget {
  final ExpiryProductsModel expiryProductsModel;
  const BuildAlertItem({Key? key,required this.expiryProductsModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
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
            RegularText(text: expiryProductsModel.name!,fontSize: 14.sp,fontWeight: FontWeight.w400,color: AppColor.black,),
          ],
        ),
      ),
    );
  }
}
