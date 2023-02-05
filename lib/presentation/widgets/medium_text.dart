
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../styles/colors.dart';

class MediumText extends StatelessWidget {
  final String text;
  final Color? color;
  final double fontSize;
  final int maxLines;
  final TextOverflow overflow;
  final TextAlign? textAlign;
  final String? fontFamily;
  final FontWeight? fontWeight;


  const MediumText({
    Key? key,
    required this.text,
    this.color,
    this.fontSize = 24,
    this.maxLines = 3,
    this.fontFamily ,
    this.fontWeight,

    this.overflow = TextOverflow.ellipsis,
    this.textAlign,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: textAlign,
      style: TextStyle(
        color: color ?? AppColor.primaryColor,
        fontFamily:fontFamily?? 'Medium',
        fontSize: fontSize.sp,
        fontWeight: fontWeight,

        overflow: overflow,
      ),
      maxLines: maxLines,
    );
  }
}
