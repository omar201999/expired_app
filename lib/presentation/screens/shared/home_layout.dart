import 'package:expired_app/business_logic/home_layout_cubit/home_layout_cubit.dart';
import 'package:expired_app/presentation/widgets/headline_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../styles/colors.dart';
import '../../widgets/regular_text.dart';

class HomeLayout extends StatelessWidget {
  const HomeLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeLayoutCubit,HomeLayoutState>(
      listener: (context,state) {},
        builder: (context,state) {
        return Scaffold(
          appBar: AppBar(title:HeadLineText(text: HomeLayoutCubit.get(context).titlesAppbar[HomeLayoutCubit.get(context).currentIndex],fontSize: 24,),centerTitle: true),
          body: Padding(
            padding: EdgeInsets.all(18.r),
            child: HomeLayoutCubit.get(context).screens[HomeLayoutCubit.get(context).currentIndex],
          ),

          bottomNavigationBar: BottomNavigationBar(
            currentIndex: HomeLayoutCubit.get(context).currentIndex,
            onTap: (index){
              HomeLayoutCubit.get(context).changeNavBar(index);
            },

            items: const [
              BottomNavigationBarItem(
                icon:Icon(Icons.home),
                label: '',
                activeIcon:  ActiveIconBottomNavBuilder(
                  icon: Icons.home,
                  title: 'Home',
                ),
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.store_sharp),
                label: '',
                activeIcon: ActiveIconBottomNavBuilder(
                  icon: Icons.store_sharp,
                  title: 'Stores',
                ),
              ),
            ],
          ) ,
        );
        },
       );
  }
}

class ActiveIconBottomNavBuilder extends StatelessWidget {
  const ActiveIconBottomNavBuilder({
    Key? key,
    required this.icon,
    required this.title,
  }) : super(key: key);

  final IconData icon;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      //height: 5.h > 45.0.h ? 45.0.h : 5.h,
     // margin: EdgeInsets.symmetric(horizontal: 0.8.h),
      decoration:  BoxDecoration(
        color: AppColor.floatingActionButtonColor,
        borderRadius: BorderRadius.all(Radius.circular(8.0.r)),
      ),
      child: Center(
        child: FittedBox(
          child: FittedBox(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Icon(
                  icon,
                  color: AppColor.primaryColor,
                ),
                SizedBox(width: 6.0.w),
                Padding(
                  padding: const EdgeInsets.only(top: 5.0),
                  child: RegularText(
                    text: title,
                    textAlign: TextAlign.center,
                    fontSize: 12.sp,
                   fontWeight: FontWeight.w500,
                   // color: AppColor.pink2,
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
