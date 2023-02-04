import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../styles/colors.dart';
import 'headline_text.dart';

class MyButton extends StatelessWidget {
  final Color? colorOfButton;
  final Color? headLineTextColor;

  final void Function() onPressed;

  final String text;

  final double width;
  final EdgeInsetsGeometry padding;
  final bool isUpper;
  final bool isBorder;

  final double borderRadius;

  const MyButton({
    Key? key,
    this.headLineTextColor=AppColor.white ,
    this.colorOfButton ,
    this.isBorder=false ,
    required this.onPressed,
    required this.text,
    this.width = double.infinity,
    this.isUpper = true,
    this.padding = EdgeInsets.zero,
    this.borderRadius = 25,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:padding,
      child: Container(
        width: width,
        height: 56.h,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(borderRadius.r),

          color: colorOfButton??AppColor.primaryColor,
          border: isBorder?Border.all(color: AppColor.black):null,

        ),
        clipBehavior: Clip.antiAliasWithSaveLayer,
        child: MaterialButton(
          // color: color,
          //height: 52.h,
          onPressed: onPressed,
          child: HeadLineText(
            text: text,
            color: headLineTextColor,
            fontSize: 18.sp,
            isUpper: isUpper,
          ),
        ),
      ),
    );
  }
}

