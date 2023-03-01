import 'package:expired_app/business_logic/store_cubit/store_cubit.dart';
import 'package:expired_app/data/model/store_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../router/app_router_names.dart';
import '../styles/colors.dart';
import 'medium_text.dart';

class BuildStoreItem extends StatelessWidget {
  final StoreModel storeModel;
  const BuildStoreItem({Key? key,required this.storeModel}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        Navigator.pushNamed(context, AppRouterNames.rCategoriesScreenRoute,arguments: storeModel.id);
      },
      child: Container(
        height: 95.h,
        decoration: BoxDecoration(
          color:  const Color(0xfff7f2f9),
          borderRadius: BorderRadius.all(Radius.circular(12.r),),
          border: Border.all(color: const Color(0xffcac4d0),width: 1.w,style: BorderStyle.solid),
        ),
        child: Padding(
          padding: EdgeInsets.all(12.r),
          child: Row(
            children: [
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children:
                  [
                    MediumText(text: storeModel.name!,fontSize: 16.sp,fontWeight: FontWeight.w500,color: AppColor.primaryColor,)
                  ],
                ),
              ),
              IconButton(
                onPressed: (){
                  Navigator.pushNamed(context, AppRouterNames.rEditStoreScreenRoute,arguments: storeModel);
                },
                icon: const Icon(Icons.edit_outlined),
                padding: EdgeInsets.zero,
                color: AppColor.primaryColor,
              ),
              IconButton(
                onPressed: (){
                  StoreCubit.get(context).deleteStore(marketId: storeModel.id!);
                },
                icon: const Icon(Icons.delete_forever),
                padding: EdgeInsets.zero,
                color: AppColor.primaryColor,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
