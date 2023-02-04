
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';


part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitial());
  static LoginCubit get(context) => BlocProvider.of(context);

  IconData suffixIcon = Icons.visibility_outlined;
  bool isPassword = true;

  void changePasswordVisibility ()
  {
    isPassword = !isPassword;
    suffixIcon = isPassword ?  Icons.visibility_outlined : Icons.visibility_off_outlined;
    emit(ChangeLoginPasswordVisibility());
  }

}
