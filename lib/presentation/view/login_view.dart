import 'package:expired_app/business_logic/user_cubit/user_cubit.dart';
import 'package:expired_app/core/constants/assets_manager.dart';
import 'package:expired_app/presentation/router/app_router_names.dart';
import 'package:expired_app/presentation/styles/colors.dart';
import 'package:expired_app/presentation/widgets/headline_text.dart';
import 'package:expired_app/presentation/widgets/my_button.dart';
import 'package:expired_app/presentation/widgets/my_form_field.dart';
import 'package:expired_app/presentation/widgets/show_toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class LoginView extends StatelessWidget {
  LoginView({Key? key}) : super(key: key);

  var userNameController = TextEditingController();
  var passwordController = TextEditingController();
  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<UserCubit, UserStates>(
      listener: (context, state) {
        if(state is LoginSuccessState)
        {
          Navigator.pushNamedAndRemoveUntil(context, AppRouterNames.rHomeLayoutRoute,(route) => false,);
        }
        else if (state is LoginErrorState){
          showToast(text:state.message, state: ToastStates.ERROR);
        }
      },
      builder: (context, state) {
        return Stack(
          children: [
            Scaffold(
              body: Column(
                children: [
                  SizedBox(height:120.h),
                  Form(
                    key: formKey,
                    child: Padding(
                      padding:  EdgeInsets.all(35.r),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          HeadLineText(
                            text: 'Login',
                            color: AppColor.black,
                            fontSize: 30.sp,
                            fontWeight: FontWeight.w500,
                          ),
                          SizedBox(
                            height: 50.h,
                          ),
                          MyFormField(
                            //prefix: IconBroken.Message,
                            hintText: 'User Name',
                            borderColor:  const Color(0xffE5E5E5),
                            //labelText: 'User Name',
                            controller: userNameController,
                            validateText:'email must not be empty',
                            maxLines: 1,
                            inputType: TextInputType.emailAddress,
                          ),
                          SizedBox(
                            height: 20.h,
                          ),
                          MyFormField(
                            //prefix: IconBroken.Password,
                            hintText:'Password',
                            controller: passwordController,
                            validateText:'password must not be empty',
                            maxLines: 1,
                            borderColor:  const Color(0xffE5E5E5),
                           //labelText: 'Password',
                            inputType: TextInputType.visiblePassword,
                            suffix: UserCubit.get(context).suffixIcon,
                            isPassword: UserCubit.get(context).isPassword,
                            suffixPressed: () {
                              UserCubit.get(context).changePasswordVisibility();
                            },
                          ),
                          SizedBox(
                            height: 25.h,
                          ),
                          state is LoginLoadingState ? const Center(child: CircularProgressIndicator(color: AppColor.primaryColor,),):MyButton(
                            onPressed: () {
                              if (formKey.currentState!.validate()) {
                                UserCubit.get(context).userLogin(userName: userNameController.text, password: passwordController.text);

                                //LoginCubit.get(context).userLogin(context,email: emailController.text, password: passwordController.text);
                              }
                            },
                            text: 'Login',
                            isUpper: false,
                            //borderRadius: 18.r,
                          ),
                        ],
                      ),
                    ),
                  ),

                ],
              ),
            ),
            Positioned(
              bottom: 0,
              right: -40.w,
              left: -40.w,
              child: Container(
                width: MediaQuery.of(context).size.width,
              height: 250.h,
              clipBehavior: Clip.antiAliasWithSaveLayer,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(topLeft: Radius.circular(500.r),topRight:Radius.circular(500.r), ),
                color: const Color(0xFFE2D8F3),
              ),
              child: Image.asset(AssetsManager.loginImage,fit: BoxFit.cover,),
            ),)
          ],
        );
      },
    );
  }
}
/*
class CurvePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint();
    paint.color =  const Color(0xFFE2D8F3);
    paint.style = PaintingStyle.stroke;
    paint.strokeWidth = 3;

    var startPoint = Offset(0, size.height / 2);
    var controlPoint1 = Offset(size.width / 4, size.height / 3);
    var controlPoint2 = Offset(3 * size.width / 4, size.height / 3);
    var endPoint = Offset(size.width, size.height / 2);

    var path = Path();
    path.moveTo(startPoint.dx, startPoint.dy);
    path.cubicTo(controlPoint1.dx, controlPoint1.dy,
        controlPoint2.dx, controlPoint2.dy,
        endPoint.dx, endPoint.dy);

    canvas.drawPath(path, paint);
  }
  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}
*/

/*
class Painter extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var startPoint = Offset(0, size.height / 2);
    var controlPoint1 = Offset(size.width / 4, size.height / 3);
    var controlPoint2 = Offset(3 * size.width / 4, size.height / 3);
    var endPoint = Offset(size.width, size.height / 2);
    var path = Path();
    path.moveTo(startPoint.dx, startPoint.dy);
    path.cubicTo(controlPoint1.dx, controlPoint1.dy,
        controlPoint2.dx, controlPoint2.dy,
        endPoint.dx, endPoint.dy);
    return path;
  }
  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}*/
