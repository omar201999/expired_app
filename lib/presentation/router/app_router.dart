
import 'package:expired_app/core/constants/constants.dart';
import 'package:expired_app/data/model/product_model.dart';
import 'package:expired_app/data/model/store_model.dart';
import 'package:expired_app/presentation/screens/user/add_product_screen.dart';
import 'package:expired_app/presentation/screens/user/add_store_screen.dart';
import 'package:expired_app/presentation/screens/user/edd_category_screen.dart';
import 'package:expired_app/presentation/screens/user/edit_prouduct_screen.dart';
import 'package:expired_app/presentation/screens/user/edit_store_screen.dart';
import 'package:expired_app/presentation/screens/user/login_screen.dart';
import 'package:flutter/material.dart';

import '../../data/model/category_model.dart';
import '../screens/shared/home_layout.dart';
import '../screens/user/add_category_screen.dart';
import '../screens/user/categories_screen.dart';
import '../screens/user/products_screen.dart';
import 'app_router_names.dart';

class AppRouter {
  Route? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case AppRouterNames.rLoginScreenRoute:
        if(userId != null)
        {
          return MaterialPageRoute(
            builder: (_) =>  const HomeLayout(),
          );
        }
        else {
          return MaterialPageRoute(
            builder: (_) =>  LoginScreen(),
          );
        }
        case AppRouterNames.rCategoriesScreenRoute:
          final marketId =settings.arguments as int;
        return MaterialPageRoute(
          builder: (_) =>  CategoriesScreen(marketId: marketId,),
        );
        case AppRouterNames.rAddCategoryScreenRoute:
          final marketId =settings.arguments as int;

          return MaterialPageRoute(
          builder: (_) =>  AddCategoryScreen(marketId: marketId,),
        );
        case AppRouterNames.rAddStoreScreenRoute:
        return MaterialPageRoute(
          builder: (_) =>  AddStoreScreen(),
        );
        case AppRouterNames.rHomeLayoutRoute:
        return MaterialPageRoute(
          builder: (_) =>  const HomeLayout(),
        );
        case AppRouterNames.rAddProductScreenRoute:
          final categoryModel =settings.arguments as CategoryModel;
          return MaterialPageRoute(
          builder: (_) =>   AddProductScreen(categoryModel: categoryModel,),
        );
        case AppRouterNames.rProductsScreenRoute:
          final categoryModel =settings.arguments as CategoryModel;
          return MaterialPageRoute(
          builder: (_) => ProductsScreen(categoryModel: categoryModel,),
        );
        case AppRouterNames.rEditProductScreenRoute:
          final productModel =settings.arguments as ProductModel;
          return MaterialPageRoute(
          builder: (_) =>   EditProductScreen(productModel: productModel,),
        );
      case AppRouterNames.rEditStoreScreenRoute:
        final storeModel = settings.arguments as StoreModel;
        return MaterialPageRoute(
          builder: (_) =>   EditStoreScreen(storeModel: storeModel),
        );
        case AppRouterNames.rEditCategoryScreenRoute:
        final categoryModel = settings.arguments as CategoryModel;
        return MaterialPageRoute(
          builder: (_) => EditCategoryScreen(categoryModel: categoryModel),
        );
      default:
        return null;
    }
  }
}
