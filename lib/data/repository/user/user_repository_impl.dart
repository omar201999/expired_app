import 'dart:convert';
import 'package:dartz/dartz.dart';
import 'package:expired_app/core/constants/error_messages.dart';
import 'package:expired_app/core/exceptions/network_exception.dart';
import 'package:expired_app/core/exceptions/server_exception.dart';
import 'package:expired_app/core/exceptions/shared_preference_exception.dart';
import 'package:expired_app/core/network_service/network_service.dart';
import 'package:expired_app/data/local/user/local_user_data_source.dart';
import 'package:expired_app/data/model/param_model/login_param_model.dart';
import 'package:expired_app/data/model/response_models/auth_response_model.dart';
import 'package:expired_app/data/remote/user/remote_user_data_source.dart';

import 'user_repository.dart';

class UserRepositoryImpl implements UserRepository {
  @override
  LocalUserDataSource localUserDataSource;

  @override
  NetworkService networkService;

  @override
  RemoteUserDataSource userDataSource;

  UserRepositoryImpl({
    required this.localUserDataSource,
    required this.userDataSource,
    required this.networkService,
  });



  @override
  Future<Either<String, AuthResponseModel>> getProfile(String token,
      {bool isEng = true}) async {
    try {
      final isConnected = await networkService.isConnected;
      if (!isConnected) {
        throw const NetworkException(
          arMessage: Network_Connection_Ar_Error,
          enMessage: Network_Connection_En_Error,
        );
      }
      final result = await userDataSource.getProfile(token);
      return Right(result);
    } on NetworkException catch (e) {
      return Left(isEng ? e.enMessage : e.arMessage);
    } on ServerException catch (e) {
      return Left(isEng ? e.enMessage : e.arMessage);
    }
  }

  @override
  Future<Either<String, AuthResponseModel>> login(
      LoginParamModel loginParamModel, bool cacheUser,
      {bool isEng = true}) async {
    try {
      final connected = await networkService.isConnected;
      if (!connected) {
        throw const NetworkException(
          arMessage: Network_Connection_Ar_Error,
          enMessage: Network_Connection_En_Error,
        );
      }
      final result = await userDataSource.login(loginParamModel);
      if (cacheUser) {
        await localUserDataSource.cacheUser(
          userData: jsonEncode(
            loginParamModel.toJson(),
          ),
        );
      }
      return Right(result);
    } on PreferenceException catch (e) {
      return Left(isEng ? e.enMessage : e.arMessage);
    } on ServerException catch (e) {
      return Left(isEng ? e.enMessage : e.arMessage);
    } on NetworkException catch (e) {
      return Left(isEng ? e.enMessage : e.arMessage);
    }
  }

  @override
  Future<Either<String, AuthResponseModel?>> loginSaved(
      {bool isEng = true}) async {
    try {
      final connected = await networkService.isConnected;
      if (!connected) {
        throw const NetworkException(
          arMessage: Network_Connection_Ar_Error,
          enMessage: Network_Connection_En_Error,
        );
      }
      final loginModel = await localUserDataSource.getUser();
      AuthResponseModel? result;
      if (loginModel != null) {
        result = await userDataSource.login(loginModel);
      }
      return Right(result);
    } on PreferenceException catch (e) {
      return Left(isEng ? e.enMessage : e.arMessage);
    } on ServerException catch (e) {
      return Left(isEng ? e.enMessage : e.arMessage);
    } on NetworkException catch (e) {
      return Left(isEng ? e.enMessage : e.arMessage);
    }
  }

  @override
  Future<Either<String, void>> logout({bool isEng = true}) async {
    try {
      return Right(await localUserDataSource.removeUser());
    } on PreferenceException catch (e) {
      return Left(isEng ? e.enMessage : e.arMessage);
    }
  }





  @override
  Future<Either<String, void>> updateCachedUser({
    String? password,
    String? email,
    bool isEng = true,
  }) async {
    try {
      final cachedUser = await localUserDataSource.getUser();
      if (cachedUser != null) {
        final emailData = email ?? cachedUser.email;
        final passData = password ?? cachedUser.password;
        final userData = LoginParamModel(email: emailData, password: passData);
        await localUserDataSource.cacheUser(userData: jsonEncode(userData));
      }
      result() {}
      return Right(result());
    } on PreferenceException catch (e) {
      return Left(isEng ? e.enMessage : e.arMessage);
    }
  }
}
