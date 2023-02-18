
import 'package:expired_app/core/dio_service/dio_service.dart';
import 'package:expired_app/data/model/param_model/login_param_model.dart';
import 'package:expired_app/data/model/response_models/auth_response_model.dart';

abstract class RemoteUserDataSource {
  late DioService dioService;

  Future<AuthResponseModel> login(LoginParamModel loginModel);

  Future<AuthResponseModel> getProfile(String token);

}
