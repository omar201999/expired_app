
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'medium_text.dart';

class HeadTitleWithIcon extends StatelessWidget {

  final Widget icon ;
  final String title ;
  final bool isArrow;
  final VoidCallback onPressed;

  HeadTitleWithIcon({Key? key,required this.icon,required this.title ,this.isArrow = true,required this.onPressed,}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Row(
        children: [
          Container(
            width: 45.w,
            height: 45.h,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(
                  15.r,
                ),
               ),
            child: icon,
          ),
          SizedBox(
            width: 20.w,
          ),
          Expanded(flex:20,child: MediumText(text: title,fontSize: 20,overflow: TextOverflow.ellipsis,maxLines: 1,)),
          const Spacer(),
          isArrow == true ? const Icon(Icons.arrow_forward_ios_rounded) : Container() ,
        ],
      ),
    );
  }
}
