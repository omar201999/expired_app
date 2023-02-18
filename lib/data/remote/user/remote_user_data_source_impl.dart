
import 'package:dio/dio.dart';
import 'package:expired_app/core/constants/end_points.dart';
import 'package:expired_app/core/dio_service/dio_service.dart';
import 'package:expired_app/core/utils/dio_method.dart';
import 'package:expired_app/data/model/param_model/login_param_model.dart';
import 'package:expired_app/data/model/response_models/auth_response_model.dart';

import 'remote_user_data_source.dart';

class RemoteUserDataSourceImpl implements RemoteUserDataSource {
  @override
  DioService dioService;

  RemoteUserDataSourceImpl({
    required this.dioService,
  });


  @override
  Future<AuthResponseModel> getProfile(String token) async {
    final result = await serverRequest(
      call: () async => await dioService.get(
        endPoint: profileGetEndPoint,
        token: token,
      ),
    );
    final response = AuthResponseModel.fromMap(result);
    return response;
  }

  @override
  Future<AuthResponseModel> login(LoginParamModel loginModel) async {
    final result = await serverRequest(
      call: () async => await dioService.post(
        endPoint: loginEndPoint,
        data: loginModel.toJson(),
      ),
    );
    final response = AuthResponseModel.fromMap(result);
    return response;
  }

}
