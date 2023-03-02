import 'package:expired_app/data/model/common_models/status_model.dart';
import 'package:expired_app/data/model/login_model.dart';

class AuthResponseModel {
  final StatusModel status;
  final LoginModel user;

  AuthResponseModel({
    required this.status,
    required this.user,
  });

  factory AuthResponseModel.fromMap(Map<String, dynamic> map) {
    return AuthResponseModel(
      status: StatusModel.fromJson(map['status']),
      user: LoginModel.fromJson(map['data']),
    );
  }
}
