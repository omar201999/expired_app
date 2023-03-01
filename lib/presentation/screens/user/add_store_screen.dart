import 'package:expired_app/business_logic/store_cubit/store_cubit.dart';
import 'package:expired_app/presentation/widgets/show_toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../router/app_router_names.dart';
import '../../styles/colors.dart';
import '../../styles/icon_broken.dart';
import '../../widgets/headline_text.dart';
import '../../widgets/my_button.dart';
import '../../widgets/my_form_field.dart';

class AddStoreScreen extends StatelessWidget {
  AddStoreScreen({Key? key}) : super(key: key);
  var newStoreNameController = TextEditingController();
  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: ()async{
        Navigator.pushNamedAndRemoveUntil(context, AppRouterNames.rHomeLayoutRoute,(route) => false);
        return false ;
      },
      child: Scaffold(
        appBar: AppBar(
          title: const HeadLineText(
            text: 'New Store',
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
                      hintText: 'Store Name',
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
                    BlocConsumer<StoreCubit,StoreState>(
                        builder: (context, state) {
                          return state is AddNewStoreLoadingState
                              ? const Center(
                                  child: CircularProgressIndicator(
                                    color: AppColor.primaryColor,
                                  ),
                                )
                              : MyButton(
                                  onPressed: () {
                                    if (formKey.currentState!.validate()) {
                                      StoreCubit.get(context).addNewStore(
                                          storeName: newStoreNameController.text);
                                    }
                                  },
                                  text: 'Add',
                                  isUpper: false,
                                  //borderRadius: 18.r,
                                );
                        },
                        listener: (context, state) {
                          if(state is AddNewStoreSuccessState)
                          {
                            showToast(text: 'New Store added Successfully ', state: ToastStates.SUCCESS);
                            Navigator.pushNamedAndRemoveUntil(context, AppRouterNames.rHomeLayoutRoute,(route) => false);

                          }
                          else if(state is AddNewStoreErrorState)
                          {
                            showToast(text: state.error, state: ToastStates.ERROR);
                          }
                        })
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
