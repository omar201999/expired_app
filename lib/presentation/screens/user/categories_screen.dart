import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:expired_app/category_cubit/category_cubit.dart';
import 'package:expired_app/core/constants/assets_manager.dart';
import 'package:expired_app/presentation/widgets/build_categorie_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../router/app_router_names.dart';
import '../../styles/colors.dart';
import '../../styles/icon_broken.dart';
import '../../widgets/headline_text.dart';

class CategoriesScreen extends StatefulWidget {
  final int marketId;

  const CategoriesScreen({Key? key, required this.marketId}) : super(key: key);

  @override
  State<CategoriesScreen> createState() => _CategoriesScreenState();
}

class _CategoriesScreenState extends State<CategoriesScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    BlocProvider.of<CategoryCubit>(context).getAllCategories(marketId: widget.marketId);
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CategoryCubit, CategoryState>(
      listener: (context, state) {},
      builder: (context, state) {
        return Scaffold(
          floatingActionButton: InkWell(
            onTap: () {
              Navigator.pushNamed(
                  context, AppRouterNames.rAddCategoryScreenRoute,arguments: widget.marketId);
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
                child: Icon(Icons.add, color: AppColor.black, size: 40),
              ),
            ),
          ),
          appBar: AppBar(
            title: const HeadLineText(
              text: 'Categories',
              fontSize: 24,
            ),
            leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(IconBroken.Arrow___Left_2),
            ),
          ),
          body: SafeArea(
            child: ConditionalBuilder(
              condition: CategoryCubit.get(context).allCategories != null && CategoryCubit.get(context).allCategories!.isNotEmpty && state is! GetAllCategoriesLoadingState,
              builder: (context) => ListView.separated(
                physics: const BouncingScrollPhysics(),
                padding: EdgeInsets.all(18.r),
                shrinkWrap: true,
                //categoryModel: CategoryCubit.get(context).allCategories![index],
                itemBuilder: (context, index) => BuildCategoryItem(categoryModel: CategoryCubit.get(context).allCategories![index],),
                separatorBuilder: (context, index) => SizedBox(
                  height: 10.h,
                ),
                itemCount: CategoryCubit.get(context).allCategories!.length,
              ),
              fallback: (context) => const Center(
                  child: CircularProgressIndicator(
                    color: AppColor.primaryColor,
                  )),
            ),
          ),
        );
      },
    );
  }

  List<String> namesOfCategories = [
    'Fruits',
    'Vegetables',
    'Medicine',
    'Beverages',
    'Food grains & Oils',
    'Bakery, Cakes & Dairy',
    'Eggs, Meat & Fish',
    'Makeup',
  ];

  List<bool> imageOrNot = [
    true,
    true,
    false,
    false,
    false,
    false,
    false,
    true,
  ];

  List<dynamic> imagesOfCategories = [
    AssetsManager.fruitsImage,
    AssetsManager.groceriesImage,
    Icons.medical_services_outlined,
    Icons.emoji_food_beverage_outlined,
    Icons.grain,
    Icons.cake_outlined,
    Icons.egg_outlined,
    AssetsManager.makeupImage,
  ];
/*
  ConditionalBuilder(
  condition: CategoryCubit.get(context).allCategories != null && CategoryCubit.get(context).allCategories!.isNotEmpty && state is! GetAllCategoriesLoadingState,
  builder: (context) => ListView.separated(
  physics: const BouncingScrollPhysics(),
  padding: EdgeInsets.all(18.r),
  shrinkWrap: true,
  //categoryModel: CategoryCubit.get(context).allCategories![index],
  itemBuilder: (context, index) => BuildCategoryItem(imageOfCategory: imagesOfCategories[index], nameOfCategory: namesOfCategories[index], imageOrNot: imageOrNot[index],),
  separatorBuilder: (context, index) => SizedBox(
  height: 10.h,
  ),
  itemCount: CategoryCubit.get(context).allCategories!.length,
  ),
  fallback: (context) => const Center(
  child: CircularProgressIndicator(
  color: AppColor.primaryColor,
  )),
  ),*/
}
