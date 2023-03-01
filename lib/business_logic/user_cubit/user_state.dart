part of 'user_cubit.dart';

@immutable
abstract class UserStates {}

class LoginInitial extends UserStates {}

class ChangeLoginPasswordVisibility extends UserStates {}




class GetProfileLoadingState extends UserStates {}

class GetProfileSuccessState extends UserStates {}

class GetProfileErrorState extends UserStates {
  final String message;

  GetProfileErrorState(this.message);
}

class LoginErrorState extends UserStates {
  final String message;

  LoginErrorState(this.message);
}
class LoginSuccessState extends UserStates {

}

class LoginLoadingState extends UserStates{}

class LoginSavedLoadingState extends UserStates {}

class LoginSavedLoadedState extends UserStates {
  final AuthResponseModel? responseModel;

  LoginSavedLoadedState(this.responseModel);
}

class LoginSavedErrorState extends UserStates {
  final String message;

  LoginSavedErrorState(this.message);
}

class LoginLoadedState extends UserStates {
  final AuthResponseModel responseModel;

  LoginLoadedState(this.responseModel);
}


class LogoutLoadingState extends UserStates {}

class LogoutLoadedState extends UserStates {
  final String message;

  LogoutLoadedState(this.message);
}

class LogoutLoadingErrorState extends UserStates {
  final String message;

  LogoutLoadingErrorState(this.message);
}
