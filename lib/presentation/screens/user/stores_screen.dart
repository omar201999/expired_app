import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:expired_app/business_logic/store_cubit/store_cubit.dart';
import 'package:expired_app/presentation/styles/colors.dart';
import 'package:expired_app/presentation/widgets/build_store_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class StoresScreen extends StatelessWidget {
  const StoresScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<StoreCubit, StoreState>(
  listener: (context, state) {
  },
  builder: (context, state) {
    return ConditionalBuilder(
      condition: StoreCubit.get(context).allStores != null && StoreCubit.get(context).allStores!.isNotEmpty && state is !GetAllStoresLoadingState,
      builder: (context)=> ListView.separated(
        physics: const BouncingScrollPhysics(),
        padding: EdgeInsets.zero,
        shrinkWrap: true,
        itemBuilder: (context,index) => BuildStoreItem(storeModel: StoreCubit.get(context).allStores![index]),
        separatorBuilder: (context,index) => SizedBox(height: 10.h,),
        itemCount: StoreCubit.get(context).allStores!.length,
      ),
      fallback: (context)=>const Center(child:CircularProgressIndicator(color: AppColor.primaryColor,)),
    );
  },
);
  }
}
