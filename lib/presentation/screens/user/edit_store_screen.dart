import 'package:expired_app/data/model/store_model.dart';
import 'package:expired_app/presentation/router/app_router_names.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../business_logic/store_cubit/store_cubit.dart';
import '../../styles/colors.dart';
import '../../styles/icon_broken.dart';
import '../../widgets/headline_text.dart';
import '../../widgets/my_button.dart';
import '../../widgets/my_form_field.dart';
import '../../widgets/show_toast.dart';

class EditStoreScreen extends StatelessWidget {
  final StoreModel storeModel;

  EditStoreScreen({Key? key, required this.storeModel}) : super(key: key);
  var newStoreNameController = TextEditingController();
  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<StoreCubit, StoreState>(
        builder: (context, state) {
      newStoreNameController.text = storeModel.name!;
      return WillPopScope(
        onWillPop: ()async{
          Navigator.pushNamedAndRemoveUntil(context, AppRouterNames.rHomeLayoutRoute,(route) => false);
          return false ;
        },
        child: Scaffold(
          appBar: AppBar(
            title: const HeadLineText(
              text: 'Edit Store',
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
            child: SingleChildScrollView(
              child: Form(
                key: formKey,
                child: Padding(
                  padding: EdgeInsets.all(16.r),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      MyFormField(
                        prefix: Icons.storefront_outlined,
                        hintText: 'New Store Name',
                        labelText: 'New Store Name',
                        borderColor: const Color(0xffE5E5E5),
                        controller: newStoreNameController,
                        validateText: 'this files must not be empty',
                        maxLines: 1,
                        autofocus: true,
                        inputType: TextInputType.name,
                      ),
                      SizedBox(
                        height: 25.h,
                      ),
                      state is UpdateStoreLoadingState
                          ? const Center(
                              child: CircularProgressIndicator(
                                color: AppColor.primaryColor,
                              ),
                            )
                          : MyButton(
                              onPressed: () {
                                if (formKey.currentState!.validate()) {
                                  StoreCubit.get(context).updateStore(
                                      marketId: storeModel.id!,
                                      newStoreName: newStoreNameController.text);
                                }
                              },
                              text: 'Update',
                              isUpper: false,
                              //borderRadius: 18.r,
                            )
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      );
    },
        listener: (context, state) {
      if (state is UpdateStoreSuccessState) {
        showToast(text: 'Store updated Successfully ', state: ToastStates.SUCCESS);
        Navigator.pushNamedAndRemoveUntil(context, AppRouterNames.rHomeLayoutRoute,(route) => false);
      } else if (state is UpdateStoreErrorState) {
        showToast(text: state.error, state: ToastStates.ERROR);
      }
    });
  }
}
