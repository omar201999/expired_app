import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../constants/assets_manager.dart';
import '../../router/app_router_names.dart';
import '../../styles/colors.dart';


class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 3), () => Navigator.pushReplacementNamed(context, AppRouterNames.rLoginScreenRoute));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColor.cyanBlue,
      child: Center(
        child: Image(
          image:  const AssetImage(AssetsManager.splashImage),
          width: 269.w,
          height: 208.h,
        ),
      ),
    );
  }
}
