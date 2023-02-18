
import 'package:dartz/dartz.dart';
import 'package:expired_app/core/network_service/network_service.dart';
import 'package:expired_app/data/local/user/local_user_data_source.dart';
import 'package:expired_app/data/model/param_model/login_param_model.dart';
import 'package:expired_app/data/model/response_models/auth_response_model.dart';
import 'package:expired_app/data/remote/user/remote_user_data_source.dart';

abstract class UserRepository {
  late LocalUserDataSource localUserDataSource;
  late RemoteUserDataSource userDataSource;
  late NetworkService networkService;

  Future<Either<String, AuthResponseModel?>> loginSaved({
    bool isEng = true,
  });

  Future<Either<String, AuthResponseModel>> login(
    LoginParamModel loginParamModel,
    bool cacheUser, {
    bool isEng = true,
  });

  Future<Either<String, void>> logout({
    bool isEng = true,
  });



  Future<Either<String, AuthResponseModel>> getProfile(
    String token, {
    bool isEng = true,
  });



  Future<Either<String, void>> updateCachedUser({
    String? password,
    String? email,
    bool isEng = true,
  });
}
