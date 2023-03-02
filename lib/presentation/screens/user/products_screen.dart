import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:expired_app/business_logic/product_cubit/product_cubit.dart';
import 'package:expired_app/presentation/widgets/build_product_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../data/model/category_model.dart';
import '../../router/app_router_names.dart';
import '../../styles/colors.dart';
import '../../styles/icon_broken.dart';
import '../../widgets/headline_text.dart';

class ProductsScreen extends StatefulWidget {
  final CategoryModel categoryModel;

  const ProductsScreen({Key? key, required this.categoryModel}) : super(key: key);

  @override
  State<ProductsScreen> createState() => _ProductsScreenState();
}

class _ProductsScreenState extends State<ProductsScreen> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<ProductCubit>(context).getAllProducts(marketId:widget.categoryModel.marketId!);
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ProductCubit, ProductState>(
      listener: (context, state) {},
      builder: (context, state) {
        return Scaffold(
          floatingActionButton: InkWell(
            onTap: () {
              Navigator.pushNamed(context, AppRouterNames.rAddProductScreenRoute,arguments: widget.categoryModel);
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
              text: 'Products',
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
              condition: ProductCubit.get(context).allProducts != null && ProductCubit.get(context).allProducts!.isNotEmpty && state is! GetAllProductsLoadingState,
              builder: (context) => ListView.separated(
                physics: const BouncingScrollPhysics(),
                padding: EdgeInsets.all(18.r),
                shrinkWrap: true,
                itemBuilder: (context, index) => InkWell(
                  onTap: () {
                    Navigator.pushNamed(context, AppRouterNames.rEditProductScreenRoute,arguments: ProductCubit.get(context).allProducts![index]);
                  },
                  child: BuildProductItem(productModel: ProductCubit.get(context).allProducts![index],),
                ),
                separatorBuilder: (context, index) => SizedBox(
                  height: 10.h,
                ),
                itemCount: ProductCubit.get(context).allProducts!.length,
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
}
