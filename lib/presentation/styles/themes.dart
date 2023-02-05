import 'package:expired_app/presentation/styles/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

ThemeMode appMode = ThemeMode.light;


ThemeData lightTheme = ThemeData(
    primarySwatch: Colors.deepPurple,
    scaffoldBackgroundColor: AppColor.white,
    appBarTheme: AppBarTheme(
      titleSpacing: 15,
      elevation: 0,
      actionsIconTheme: const IconThemeData(
        color: AppColor.cyanBlue,
      ),
      backgroundColor: AppColor.white,
      iconTheme: const IconThemeData(
        color: AppColor.cyanBlue,
      ),
      titleTextStyle: TextStyle(
        fontSize: 24.sp,
        color: AppColor.cyanBlue,
        fontWeight: FontWeight.bold,
        fontFamily: 'SemiBold',
      ),
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      type: BottomNavigationBarType.fixed,
      backgroundColor: AppColor.floatingActionButtonColor,
      selectedItemColor: AppColor.primaryColor,
      unselectedItemColor: AppColor.black,
      elevation: 20,
      selectedLabelStyle: TextStyle(
        fontFamily: 'Regular',
        fontSize: 17.sp,
      ),
     /* unselectedLabelStyle: TextStyle(
        fontFamily: 'Regular',
        fontSize: 17.sp,
      ),
      selectedIconTheme: IconThemeData(
        size: 30,
      ),
      unselectedIconTheme: IconThemeData(
        size: 30,
      ),*/
    ),
    iconTheme: const IconThemeData(
      color: AppColor.primaryColor,
    ),
    //fontFamily: 'SemiBold',
    //cardColor: AppColor.white,
    cardTheme: CardTheme(
      color:  AppColor.white,
      elevation: 0,
      clipBehavior: Clip.antiAliasWithSaveLayer,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(25.r),),
      ),
    ),
  floatingActionButtonTheme: FloatingActionButtonThemeData(
    backgroundColor: AppColor.floatingActionButtonColor,
    elevation: 3,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(15.r)),
    )
  ),
  drawerTheme: const DrawerThemeData(
    backgroundColor: Color(0xfff7f2f9),
  )
);


ThemeData darkTheme = ThemeData(
    primarySwatch: Colors.blue,
    /* bottomSheetTheme: BottomSheetThemeData(
      backgroundColor: AppColor.black
  ),*/
    scaffoldBackgroundColor: AppColor.black,
    appBarTheme: const AppBarTheme(
      titleSpacing: 12,
      //backwardsCompatibility: false,
      systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: Color(0xff242526),
          //HexColor('#18191a'),//#1c1c1c 0xff18191a
          statusBarBrightness: Brightness.light),
      backgroundColor: AppColor.black,
      elevation: 0.0,
      iconTheme: IconThemeData(
        color: Colors.white,
      ),
      titleTextStyle: TextStyle(
        fontSize: 24,
        color: AppColor.white,
        fontWeight: FontWeight.bold,
        fontFamily: 'SemiBold',
      ),
      actionsIconTheme: IconThemeData(
        color: Colors.white,
      ),
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      type: BottomNavigationBarType.fixed,
      backgroundColor: AppColor.black,
      selectedItemColor: AppColor.blue,
      unselectedItemColor: AppColor.white,
      elevation: 0,
      selectedLabelStyle: TextStyle(
        fontFamily: 'Regular',
        fontSize: 17.sp,
      ),
      unselectedLabelStyle: TextStyle(
        fontFamily: 'Regular',
        fontSize: 17.sp,
      ),
      selectedIconTheme: const IconThemeData(
        size: 30,
      ),
      unselectedIconTheme: const IconThemeData(
        size: 30,
      ),
    ),
    textTheme: const TextTheme(
      caption: TextStyle(
        color: Color(0xFFD4D4D4),
      ),
    ),
    fontFamily: 'SemiBold',
    iconTheme: const IconThemeData(color: AppColor.white),
    cardTheme: CardTheme(
      color: AppColor.darkGrey,
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(30.r),),
      ),
    )

);
