
import 'package:bloc/bloc.dart';
import 'package:expired_app/core/constants/error_messages.dart';
import 'package:expired_app/core/utils/string_extension.dart';
import 'package:expired_app/data/model/param_model/login_param_model.dart';
import 'package:expired_app/data/model/response_models/auth_response_model.dart';
import 'package:expired_app/data/model/user_model.dart';
import 'package:expired_app/data/repository/user/user_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';


part 'user_state.dart';

class UserCubit extends Cubit<UserStates> {

  final UserRepository userRepository;
  UserModel? user;
  bool isEng = true;

  UserCubit({required this.userRepository}) : super(LoginInitial());
  static UserCubit get(context) => BlocProvider.of(context);

  IconData suffixIcon = Icons.visibility_outlined;
  bool isPassword = true;

  void changePasswordVisibility ()
  {
    isPassword = !isPassword;
    suffixIcon = isPassword ?  Icons.visibility_outlined : Icons.visibility_off_outlined;
    emit(ChangeLoginPasswordVisibility());
  }

  Future getProfile() async {
    emit(GetProfileLoadingState());
    final result = await userRepository.getProfile(user!.token, isEng: isEng);
    result.fold(
          (l) {
        emit(GetProfileErrorState(l));
      },
          (r) {
        user = r.user;
        emit(GetProfileSuccessState());
      },
    );
  }

  Future loginSaved() async {
    emit(LoginSavedLoadingState());
    final result = await userRepository.loginSaved(isEng: isEng);
    result.fold(
          (l) {
        emit(LoginSavedErrorState(l));
      },
          (r) {
        user = r?.user;
        emit(LoginSavedLoadedState(r));
      },
    );
  }

  Future login(
      LoginParamModel paramModel,
      bool rememberMe,
      ) async {
    emit(LoginLoadingState());
    if (paramModel.email.isNotEmpty && !paramModel.email.isValidEmail()) {
      emit(
        LoginErrorState(
          isEng ? Invalid_Email_Format_En_Err : Invalid_Email_Format_Ar_Err,
        ),
      );
      return;
    }
    final result =
    await userRepository.login(paramModel, rememberMe, isEng: isEng);
    result.fold(
          (l) {
        emit(LoginErrorState(l));
      },
          (r) {
        user = r.user;
        emit(LoginLoadedState(r));
      },
    );
  }

  Future logout() async {
    emit(LogoutLoadingState());
    final result = await userRepository.logout(isEng: isEng);
    result.fold(
          (l) {
        emit(LogoutLoadingErrorState(l));
      },
          (r) {
        user = null;
        const logoutSuccessArMessage = 'تم تسجيل الخروج';
        const logoutSuccessEnMessage = 'You have logged out successfully';
        emit(LogoutLoadedState(
            isEng ? logoutSuccessEnMessage : logoutSuccessArMessage));
      },
    );
  }

}
