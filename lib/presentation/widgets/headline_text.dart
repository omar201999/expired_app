
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../styles/colors.dart';

class HeadLineText extends StatelessWidget {
  final String text;
  final String? fontFamily;
  final Color? color;
  final double fontSize;
  final int maxLines;
  final bool? isUpper;
  final TextAlign? textAlign;
  final TextOverflow overflow;
  final TextDecoration? decoration;
  final Color? decorationColor;
  final FontWeight? fontWeight;

  const HeadLineText({
    Key? key,
    required this.text,
    this.color,
    this.fontSize = 32,
    this.maxLines = 1,
    this.fontFamily ,
    this.overflow = TextOverflow.ellipsis,
    this.isUpper = true,
    this.textAlign,
    this.fontWeight,

    this.decoration,
    this.decorationColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      isUpper! ? text.toUpperCase() : text,
      style: TextStyle(
          color: color ?? AppColor.primaryColor,
          fontFamily:fontFamily?? 'SemiBold',
          fontSize: fontSize.sp,
          fontWeight: fontWeight,
          overflow: overflow,
        decoration: decoration,
        decorationColor: decorationColor,

        decorationThickness: 2
      ),
      maxLines: maxLines,
      textAlign: textAlign,
    );
  }
}
