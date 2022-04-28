import 'package:data/dio/dio_builder.dart';
import 'package:data/dio/token_interceptor.dart';
import 'package:data/repository/local_storage_repository.dart';
import 'package:data/repository/network_repository.dart';
import 'package:data/service/api_service.dart';
import 'package:dio/dio.dart';
import 'package:domain/repository/local_storage_repository.dart';
import 'package:domain/repository/network_repository.dart';
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

  sl.registerSingleton<ILocalStorageRepository>(
    LocalStorageRepository(
      sl.get<SharedPreferences>(),
    ),
  );

  sl.registerSingleton<TokenInterceptor>(
    TokenInterceptor(
      sl.get<ILocalStorageRepository>(),
    ),
  );

  sl.registerSingleton<LogInterceptor>(
    LogInterceptor(requestBody: true, responseBody: true),
  );

  sl.registerSingleton<Dio>(
    dioBuilder(
      'http://jenkins-mobile.moneyman.ru/',
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

  sl.registerSingleton<INetworkRepository>(
    NetworkRepository(
      sl.get<ApiService>(),
      sl.get<CancelToken>(),
    ),
  );
}
