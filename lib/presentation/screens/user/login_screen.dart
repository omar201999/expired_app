import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:expired_app/business_logic/login_cubit/login_cubit.dart';
import 'package:expired_app/presentation/router/app_router_names.dart';
import 'package:expired_app/presentation/styles/colors.dart';
import 'package:expired_app/presentation/styles/icon_broken.dart';
import 'package:expired_app/presentation/widgets/headline_text.dart';
import 'package:expired_app/presentation/widgets/medium_text.dart';
import 'package:expired_app/presentation/widgets/my_button.dart';
import 'package:expired_app/presentation/widgets/my_form_field.dart';
import 'package:expired_app/presentation/widgets/regular_text.dart';
import 'package:expired_app/presentation/widgets/show_toast.dart';
class LoginScreen extends StatelessWidget {
  LoginScreen({Key? key}) : super(key: key);

  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginCubit, LoginState>(
      listener: (context, state) {
        if(state is LoginSuccessState)
        {
          //Navigator.pushNamedAndRemoveUntil(context, AppRouterNames.rHomeLayoutScreenRoute,(route) => false,arguments:context);
        }
         else if (state is LoginErrorState){
                  showToast(text:state.error, state: ToastStates.ERROR);
                }
      },
      builder: (context, state) {
  return Scaffold(

               body: Center(
               child:SingleChildScrollView(
                                      child: Form(
                                        key: formKey,
                                        child: Padding(
                                          padding: EdgeInsets.all(16.r),
                                          child: Column(
                                            mainAxisAlignment: MainAxisAlignment.start,
                                            children: [
                                              SizedBox(
                                                height: 35.h,
                                              ),
                                              HeadLineText(
                                                text: 'Welcome in Expired',

                                              ),
                                              SizedBox(
                                                height: 25.h,
                                              ),
                                              MediumText(
                                                text: 'don\'t lose access to your account',

                                              ),
                                              SizedBox(
                                                height: 35.h,
                                              ),
                                              MyFormField(
                                                prefix: IconBroken.Message,
                                                hintText: 'Email',
                                                controller: emailController,
                                                validateText:'email must not be empty',
                                                maxLines: 1,
                                                inputType: TextInputType.text,
                                              ),
                                              SizedBox(
                                                height: 10.h,
                                              ),
                                              MyFormField(
                                                prefix: IconBroken.Password,
                                                hintText:'Password',
                                                controller: passwordController,
                                                validateText:'password must not be empty',
                                                maxLines: 1,
                                                inputType: TextInputType.text,
                                                suffix: LoginCubit.get(context).suffixIcon,
                                                isPassword: LoginCubit.get(context).isPassword,
                                                suffixPressed: () {
                                                  LoginCubit.get(context).changePasswordVisibility();
                                                },
                                              ),
                                              SizedBox(
                                                height: 25.h,
                                              ),
                                               state is LoginLoadingState ? const Center(child: CircularProgressIndicator(color: AppColor.white,),):MyButton(
                                                onPressed: () {
                                                  if (formKey.currentState!.validate()) {
                                                            Navigator.pushNamedAndRemoveUntil(context, AppRouterNames.rHomeLayoutRoute,(route) => false,);

                                                    //LoginCubit.get(context).userLogin(context,email: emailController.text, password: passwordController.text);
                                                  }
                                                },
                                                text: 'Sign In',
                                                borderRadius: 15.r,

                                              ),
                                              SizedBox(
                                                height: 25.h,
                                              ),
                                              RegularText(
                                                text: 'Verify instantly by connecting your account',

                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
               ),
             );
      },
    );
  }
}
