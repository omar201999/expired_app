
import 'package:expired_app/business_logic/home_layout_cubit/home_layout_cubit.dart';
import 'package:expired_app/presentation/screens/user/add_store_screen.dart';
import 'package:expired_app/presentation/screens/user/login_screen.dart';
import 'package:flutter/material.dart';

import '../screens/shared/home_layout.dart';
import '../screens/shared/splash_screen.dart';
import 'app_router_names.dart';

class AppRouter {
  Route? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
    /*  case AppRouterNames.rSplashScreenRoute:
        return MaterialPageRoute(
          builder: (_) => const SplashScreen(),
        );*/

      case AppRouterNames.rLoginScreenRoute:
        return MaterialPageRoute(
          builder: (_) =>  LoginScreen(),
        );
        case AppRouterNames.rAddStoreScreenRoute:
        return MaterialPageRoute(
          builder: (_) =>  AddStoreScreen(),
        );
        case AppRouterNames.rHomeLayoutRoute:
        return MaterialPageRoute(
          builder: (_) =>  const HomeLayout(),
        );
      default:
        return null;
    }
  }
}
