import 'package:expired_app/business_logic/bloc_observer.dart';
import 'package:expired_app/business_logic/global_cubit/global_cubit.dart';
import 'package:expired_app/business_logic/home_layout_cubit/home_layout_cubit.dart';
import 'package:expired_app/business_logic/user_cubit/user_cubit.dart';
import 'package:expired_app/core/di/injection_container.dart';
import 'package:expired_app/data/local/cache_helper.dart';
import 'package:expired_app/presentation/styles/themes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'presentation/router/app_router.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initApp();
  // bool? isDark = CacheHelper.getDataFromSharedPreference(key: 'isDark')??false;
  // Bloc.observer = MyBlocObserver();
  runApp(MyApp(
    appRouter: AppRouter(),
  ));
}

class MyApp extends StatelessWidget {
  final AppRouter appRouter;


  const MyApp({required this.appRouter, Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(414, 896),
      builder: (context, child) {
        return MultiBlocProvider(
          providers:
          [
            BlocProvider(
              create: (context) => serviceLocator<GlobalCubit>()..initApp(),
            ),
            BlocProvider(
              create: (context) => serviceLocator<UserCubit>(),
            ),
          ],
          child: BlocConsumer<GlobalCubit, GlobalState>(
            listener: (context, state) {
            },
            builder: (context, state) {
              final global = GlobalCubit.get(context);
              return MaterialApp(
                onGenerateRoute: appRouter.onGenerateRoute,
                debugShowCheckedModeBanner: false,
                theme: lightTheme,
                themeMode: global.appMode,
                darkTheme: darkTheme,
              );
            },
          ),
        );
      },
    );
  }
}

