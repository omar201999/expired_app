import 'package:expired_app/core/shared_preferences/preference_helper.dart';
import 'package:expired_app/data/model/param_model/login_param_model.dart';

abstract class LocalUserDataSource{
  late PreferenceHelper cacheHelper;

  Future<void> cacheUser({
    required String userData,
  });

  Future<void> removeUser();

  Future<LoginParamModel?> getUser();
}