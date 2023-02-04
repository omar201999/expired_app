
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../styles/colors.dart';

class RegularText extends StatelessWidget {
  final String text;
  final Color? color;
  final double fontSize;
  final double lineHeight;
  final FontWeight? fontWeight;
  final bool isLineThrow;
  final int? maxLines;
  final TextAlign? textAlign;
  final TextOverflow? overflow;
  final String? fontFamily;

  const RegularText({
    Key? key,
    required this.text,
    this.color,
    this.fontSize = 18,
    this.maxLines,
    this.fontFamily,
    this.overflow ,
    this.textAlign,
    this.fontWeight,
    this.lineHeight = 1,
    this.isLineThrow = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        color: color ?? AppColor.primaryColor,
        fontFamily: fontFamily??'Regular',
        fontSize: fontSize.sp,
        fontWeight: fontWeight,
        overflow: overflow,
        decoration: isLineThrow == false
            ? TextDecoration.none
            : TextDecoration.lineThrough,
        height: lineHeight,
      ),

      textAlign: textAlign,
    );
  }
}
