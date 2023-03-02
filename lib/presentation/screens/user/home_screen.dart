import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:expired_app/business_logic/home_layout_cubit/home_layout_cubit.dart';
import 'package:expired_app/presentation/styles/colors.dart';
import 'package:expired_app/presentation/widgets/medium_text.dart';
import 'package:expired_app/presentation/widgets/regular_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../widgets/build_alert_item.dart';
import '../../widgets/deadtitle_with_icon.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeLayoutCubit, HomeLayoutState>(
  listener: (context, state) {
    // TODO: implement listener
  },
  builder: (context, state) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children:
        [
          MediumText(text: 'Hi, ${HomeLayoutCubit.get(context).userModel!=null?HomeLayoutCubit.get(context).userModel!.fullName!:''}',fontSize: 16.sp,fontWeight: FontWeight.w500,maxLines: 3),
          SizedBox(height: 20.h,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                width: 100.w,
                height: 60.h,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(6.r)),
                  color: const Color(0xffE46962)
                ),
                child: Padding(
                  padding: EdgeInsets.all(10.r),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children:
                    [
                      RegularText(text: '2',fontSize: 12.sp,fontWeight: FontWeight.w500,color: AppColor.white),
                      SizedBox(height:5.h ,),
                      RegularText(text: 'Expiring Soon',fontSize: 12.sp,fontWeight: FontWeight.w500,color: AppColor.white),
                    ],
                  ),
                ),
              ),
              Container(
                width: 100.w,
                height: 60.h,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(6.r)),
                  color:  const Color(0xfff7f2f9)
                ),
                child: Padding(
                  padding: EdgeInsets.all(10.r),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children:
                    [
                      RegularText(text: '2',fontSize: 12.sp,fontWeight: FontWeight.w500,color: AppColor.black),
                      SizedBox(height:5.h ,),
                      RegularText(text: 'Good-To-Use',fontSize: 12.sp,fontWeight: FontWeight.w500,color: AppColor.black),
                    ],
                  ),
                ),
              ),
              Container(
                width: 100.w,
                height: 60.h,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(6.r)),
                    color:  const Color(0xfff7f2f9)
                ),
                child: Padding(
                  padding: EdgeInsets.all(10.r),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children:
                    [
                      RegularText(text: '2',fontSize: 12.sp,fontWeight: FontWeight.w500,color: AppColor.black),
                      SizedBox(height:5.h ,),
                      RegularText(text: 'Expiring Soon',fontSize: 12.sp,fontWeight: FontWeight.w500,color: AppColor.black),
                    ],
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 20.h,),
          Divider(
            thickness: 1.h,
            height: 1.h,
            color: const Color(0xffcac4d0),
          ),
          SizedBox(height: 25.h,),
          RegularText(text: 'Alerts',fontSize: 14.sp,fontWeight: FontWeight.w500,),
          SizedBox(height: 25.h,),
          ConditionalBuilder(
            condition: HomeLayoutCubit.get(context).allExpiryProducts != null && HomeLayoutCubit.get(context).allExpiryProducts!.isNotEmpty ,
           builder: (context)=>SizedBox(
             height: 80.h,
             child: ListView.separated(
               physics: const BouncingScrollPhysics(),
               padding: EdgeInsets.zero,
               shrinkWrap: true,
               scrollDirection: Axis.horizontal,
               itemBuilder: (context,index) => BuildAlertItem(expiryProductsModel: HomeLayoutCubit.get(context).allExpiryProducts![index]) ,
               separatorBuilder: (context,index) => SizedBox(width: 10.w,),
               itemCount:  HomeLayoutCubit.get(context).allExpiryProducts!.length,
             ),
           ),
            fallback: (context) => const Center(child: CircularProgressIndicator(color: AppColor.primaryColor,)),
          ),
          SizedBox(height: 20.h,),
          Divider(
            thickness: 1.h,
            height: 1.h,
            color: const Color(0xffcac4d0),
          ),
          SizedBox(height: 25.h,),
          RegularText(text: 'Some Statistics',fontSize: 14.sp,fontWeight: FontWeight.w500,),
          SizedBox(height: 25.h,),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
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
                      Expanded(child: MediumText(text: 'All Stores number',fontSize: 16.sp,fontWeight: FontWeight.w500,color: AppColor.black,)),
                      SizedBox(height: 8.h),
                      RegularText(text: '10',fontSize: 14.sp,fontWeight: FontWeight.w400,color: AppColor.black,),
                    ],
                  ),
                ),
              ),
              Container(
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
                      Expanded(child: MediumText(text: 'All Products number',fontSize: 16.sp,fontWeight: FontWeight.w500,color: AppColor.black,)),
                      SizedBox(height: 8.h),
                      RegularText(text: '100',fontSize: 14.sp,fontWeight: FontWeight.w400,color: AppColor.black,),
                    ],
                  ),
                ),
              ),


            ],
          ),
          SizedBox(height: 25.h,),
          RegularText(text: 'Settings',fontSize: 14.sp,fontWeight: FontWeight.w500,),
          SizedBox(height: 20.h,),
          Column(
            children: [
              Card(
              color:  const Color(0xfff7f2f9),
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      HeadTitleWithIcon(
                        onPressed: () {
                          /*showModalBottomSheet(
                            context: context,
                            builder: (context) => const Bottom(),
                          );*/
                        },
                        icon: Container(
                          clipBehavior: Clip.antiAliasWithSaveLayer,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15.r),
                              color: AppColor.white),
                          child: const Icon(Icons.language,color: AppColor.primaryColor,),
                        ),
                        title: 'Language',
                        isArrow: true,
                      ),
                      SizedBox(
                        height: 25.h,
                      ),
                      HeadTitleWithIcon(
                        onPressed: () {
                          //Navigator.pushNamed(context, AppRouterNames.rHelpScreenRoute);
                        },
                        icon: Container(
                          clipBehavior: Clip.antiAliasWithSaveLayer,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15.r),
                              color: AppColor.white),
                          child: const Icon(Icons.quiz_rounded,color: AppColor.primaryColor,),
                        ),
                        title:'Help',
                        isArrow: true,
                      ),
                      SizedBox(
                        height: 25.h,
                      ),
                      HeadTitleWithIcon(
                        icon: Container(
                          clipBehavior: Clip.antiAliasWithSaveLayer,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15.r),
                              color: AppColor.white),
                          child: const Icon(
                            Icons.privacy_tip,
                            color: AppColor.primaryColor,
                          ),
                        ),
                        title: 'Privacy',
                        onPressed: () {
                         // Navigator.pushNamed(context, AppRouterNames.rPolicyScreenRoute);
                        },
                      ),
                    ],
                  ),
                ),
              ),

            ],
          )
        ],
      ),
    );
  },
);
  }
}
/*
class Bottom extends StatefulWidget {
  const Bottom({Key? key}) : super(key: key);

  @override
  State<Bottom> createState() => _BottomState();
}

class _BottomState extends State<Bottom> {
  bool isEnglish = true;
  String languageCode = 'en';

  void _changeLanguage(String languageCode) async {
    Locale locale = await setLocale(languageCode);
    MyApp.setLocale(context, locale);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height * 0.25,
      color: AppColor.white,
      child: Padding(
        padding: EdgeInsets.all(12.r),
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: MyButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    text: 'Cancel',
                    headLineTextColor: AppColor.black,
                    isBorder: true,
                    isGradient: false,
                    colorOfButton: AppColor.white,
                  ),
                ),
                SizedBox(
                  width: 5.w,
                ),
                Expanded(
                  child: MyButton(
                    onPressed: () {
                      _changeLanguage(languageCode);
                      Navigator.pop(context);
                    },
                    text: 'Apply',
                    isGradient: false,
                    colorOfButton: AppColor.pink,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 10.h,
            ),
            InkWell(
              child: Container(
                color: isEnglish ? AppColor.pink : AppColor.white,
                child: Padding(
                  padding: EdgeInsets.all(12.r),
                  child: const Center(
                      child: MediumText(
                        text: 'English',
                      )),
                ),
              ),
              onTap: () {
                setState(() {
                  isEnglish = true;
                  languageCode = 'en';
                });
              },
            ),
            InkWell(
              onTap: () {
                setState(() {
                  isEnglish = false;
                  languageCode = 'ar';
                });
              },
              child: Container(
                color: isEnglish ? AppColor.white : AppColor.pink,
                child: Padding(
                  padding: EdgeInsets.all(12.r),
                  child: const Center(
                      child: MediumText(
                        text: 'العربية',
                      )),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}*/
