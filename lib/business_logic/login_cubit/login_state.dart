part of 'login_cubit.dart';

@immutable
abstract class LoginState {}

class LoginInitial extends LoginState {}

class ChangeLoginPasswordVisibility extends LoginState {}

class LoginLoadingState extends LoginState{}


class LoginSuccessState extends LoginState
{

}

class LoginErrorState extends LoginState
{
  final String error;
  LoginErrorState(this.error);
}