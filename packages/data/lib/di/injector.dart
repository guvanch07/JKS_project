import 'package:data/core/api_key.dart';
import 'package:data/dio/dio_builder.dart';
import 'package:data/dio/token_interceptor.dart';
import 'package:data/repository/token_storage_repository.dart';
import 'package:data/repository/network_repository.dart';
import 'package:data/repository/property_repository.dart';
import 'package:data/service/api_service.dart';
import 'package:dio/dio.dart';
import 'package:domain/repository/token_repository.dart';
import 'package:domain/repository/login_network_repository.dart';
import 'package:domain/repository/build_network_repository.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<void> injectDataModule() async {
  final sl = GetIt.I;

  sl.registerFactory<CancelToken>(
    () => CancelToken(),
  );

  sl.registerSingleton<SharedPreferences>(
    await SharedPreferences.getInstance(),
  );

  sl.registerSingleton<ITokenStorageRepository>(
    TokenStorageRepository(
      sl.get<SharedPreferences>(),
    ),
  );

  sl.registerSingleton<TokenInterceptor>(
    TokenInterceptor(
      sl.get<ITokenStorageRepository>(),
    ),
  );

  sl.registerSingleton<LogInterceptor>(
    LogInterceptor(requestBody: true, responseBody: true),
  );

  sl.registerSingleton<Dio>(
    dioBuilder(
      ApiHelperCore.baseUrl,
      [
        sl.get<LogInterceptor>(),
        sl.get<TokenInterceptor>(),
      ],
    ),
  );

  sl.registerSingleton(
    ApiService(
      sl.get<Dio>(),
    ),
  );

  sl.registerSingleton<ILoginNetworkRepository>(
    NetworkRepository(
      sl.get<ApiService>(),
      sl.get<CancelToken>(),
    ),
  );

  sl.registerSingleton<IBuildNetworkRepository>(
      BuildNetworkRepository(sl.get<ApiService>()));
}
