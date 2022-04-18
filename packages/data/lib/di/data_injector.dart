import 'package:data/core/api_key.dart';
import 'package:data/dio/dio_builder.dart';
import 'package:data/dio/token_interceptor.dart';
import 'package:data/repository/local_storage.dart';
import 'package:data/repository/network_repository.dart';
import 'package:data/service/api_service.dart';
import 'package:dio/dio.dart';
import 'package:domain/repository/local_base_repo.dart';
import 'package:domain/repository/network_repository.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<void> initDataModule() async {
  final sl = GetIt.I;

  sl.registerFactory<CancelToken>(
    () => CancelToken(),
  );

  sl.registerSingleton<SharedPreferences>(
    await SharedPreferences.getInstance(),
  );

  sl.registerSingleton<ILocalStorageRepo>(
    LocalStorageRepository(
      sl.get<SharedPreferences>(),
    ),
  );

  sl.registerSingleton<TokenInterceptor>(
    TokenInterceptor(
      sl.get<ILocalStorageRepo>(),
    ),
  );

  sl.registerSingleton<LogInterceptor>(
    LogInterceptor(requestBody: true, responseBody: true),
  );

  final List<Interceptor> listOfInterseptors = [
    sl.get<LogInterceptor>(),
    sl.get<TokenInterceptor>(),
  ];

  sl.registerSingleton<Dio>(
    dioBuilder(
      ApiHelperCore.baseUrl,
      listOfInterseptors,
      ApiHelperCore.authHeader,
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
