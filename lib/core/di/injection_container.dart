
import 'package:expired_app/business_logic/bloc_observer.dart';
import 'package:expired_app/business_logic/global_cubit/global_cubit.dart';
import 'package:expired_app/business_logic/user_cubit/user_cubit.dart';
import 'package:expired_app/core/dio_service/dio_provider.dart';
import 'package:expired_app/core/dio_service/dio_service.dart';
import 'package:expired_app/core/dio_service/dio_service_impl.dart';
import 'package:expired_app/core/network_service/network_provider.dart';
import 'package:expired_app/core/network_service/network_service.dart';
import 'package:expired_app/core/network_service/network_service_impl.dart';
import 'package:expired_app/core/shared_preferences/preference_helper.dart';
import 'package:expired_app/core/shared_preferences/preferences_provider.dart';
import 'package:expired_app/data/local/user/local_user_data_source.dart';
import 'package:expired_app/data/local/user/local_user_data_source_impl.dart';
import 'package:expired_app/data/remote/user/remote_user_data_source.dart';
import 'package:expired_app/data/remote/user/remote_user_data_source_impl.dart';
import 'package:expired_app/data/repository/global/global_repository.dart';
import 'package:expired_app/data/repository/global/global_repository_impl.dart';
import 'package:expired_app/data/repository/user/user_repository.dart';
import 'package:expired_app/data/repository/user/user_repository_impl.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

final serviceLocator = GetIt.instance;

Future initApp() async {
  Bloc.observer = MyBlocObserver();

  /// ui cubit
  serviceLocator.registerFactory(
    () => GlobalCubit(
      globalRepository: serviceLocator(),
    ),
  );

  serviceLocator.registerFactory(
    () => UserCubit(
      userRepository: serviceLocator(),
    ),
  );


  /// repositories
  serviceLocator.registerLazySingleton<GlobalRepository>(
        () => GlobalRepositoryImpl(
      helper: serviceLocator(),
    ),
  );
  serviceLocator.registerLazySingleton<UserRepository>(
    () => UserRepositoryImpl(
      localUserDataSource: serviceLocator(),
      userDataSource: serviceLocator(),
      networkService: serviceLocator(),
    ),
  );


  /// others
  serviceLocator.registerLazySingleton<LocalUserDataSource>(
    () => LocalUserDataSourceImpl(
      cacheHelper: serviceLocator(),
    ),
  );

  serviceLocator.registerLazySingleton<RemoteUserDataSource>(
    () => RemoteUserDataSourceImpl(
       dioService: serviceLocator(),
    ),
  );
  // serviceLocator.registerLazySingleton<BookingDataSource>(
  //   () => BookingDataSourceImpl(
  //     dioService: serviceLocator(),
  //   ),
  // );


  /// services
  serviceLocator.registerLazySingleton<PreferenceHelper>(
    () => PreferenceHelper(
      preferencesProvider: serviceLocator(),
    ),
  );
  serviceLocator.registerLazySingleton<DioService>(
    () => DioServiceImpl(
      dioProvider: serviceLocator(),
    ),
  );
  serviceLocator.registerLazySingleton<NetworkService>(
    () => NetworkServiceImpl(
      networkProvider: serviceLocator(),
    ),
  );

  /// providers
  serviceLocator.registerLazySingleton(
    () => SharedPreferencesProvider.instance,
  );
  serviceLocator.registerLazySingleton<DioProvider>(
    () => DioProvider.instance,
  );
  serviceLocator.registerLazySingleton<NetworkProvider>(
    () => NetworkProvider.instance,
  );
}
