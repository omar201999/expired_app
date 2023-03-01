import 'package:expired_app/business_logic/global_cubit/global_cubit.dart';
import 'package:expired_app/presentation/router/app_router_names.dart';
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
    return BlocConsumer<GlobalCubit,GlobalState>(
      listener: (context,state) {},
        builder: (context,state) {

        var global = GlobalCubit.get(context);

        return Scaffold(
          floatingActionButton: global.currentIndex==1?InkWell(
            onTap: (){
              Navigator.pushNamed(context, AppRouterNames.rAddStoreScreenRoute);
            },
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(15.r)),
                color: const Color(0xFFEBDDFF),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 3,
                    blurRadius: 7,
                    offset: const Offset(3, 0), // changes position of shadow
                  ),
                ],
              ),

              height: 60.h,
              width: 60.w,
              child: const Center(
                child: Icon(Icons.add,color: AppColor.black,size:40 ),
              ),
            ),
          ):null,
          drawer: const Drawer(),
          appBar: AppBar(
              title:HeadLineText(text: global.titlesAppbar[global.currentIndex],fontSize: 24,),
              centerTitle: true,
            actions: const [
              Icon(Icons.notification_add_outlined),
              SizedBox(width: 5,),

            ],
          ),
          body: Padding(
            padding: EdgeInsets.all(18.r),
            child: global.screens[global.currentIndex],
          ),

          bottomNavigationBar: BottomNavigationBar(
            currentIndex: global.currentIndex,
            onTap: (index){
              global.changeNavBar(index);
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
