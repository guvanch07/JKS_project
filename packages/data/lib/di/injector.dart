import 'package:data/core/api_key.dart';
import 'package:data/dio/dio_builder.dart';
import 'package:data/dio/intercepters/cookie_interceptor.dart';
import 'package:data/dio/intercepters/refresh_token_interceptor.dart';
import 'package:data/dio/intercepters/token_interceptor.dart';
import 'package:data/repository/local_storage_repository.dart';
import 'package:data/repository/network_repository.dart';
import 'package:data/repository/property_repository.dart';
import 'package:data/repository/request_impl_repository.dart';
import 'package:data/service/api_service.dart';
import 'package:dio/dio.dart';
import 'package:domain/repository/local_storage_repository.dart';
import 'package:domain/repository/login_network_repository.dart';
import 'package:domain/repository/build_network_repository.dart';
import 'package:domain/repository/request_network_repo.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<void> injectDataModule() async {
  final sl = GetIt.I;

//! services
  sl.registerSingleton<SharedPreferences>(
    await SharedPreferences.getInstance(),
  );

  sl.registerSingleton<Dio>(
    dioBuilder(
      ApiHelperCore.baseUrl,
      [
        sl.get<LogInterceptor>(),
        sl.get<TokenInterceptor>(),
        sl.get<RefreshTokenInterceptor>(),
        sl.get<CookieInterceptor>(),
      ],
    ),
  );

  sl.registerSingleton(
    ApiService(
      sl.get<Dio>(),
    ),
  );

//! repositories

  sl.registerSingleton<ILocalStorageRepository>(
    LocalStorageRepository(
      sl.get<SharedPreferences>(),
    ),
  );

  sl.registerSingleton<IRequestRepository>(
    RequestRepository(
      sl.get<ApiService>(),
    ),
  );

  sl.registerSingleton<ILoginNetworkRepository>(
    LoginNetworkRepository(
      sl.get<ApiService>(),
      sl.get<CancelToken>(),
    ),
  );

  sl.registerSingleton<IBuildNetworkRepository>(
    BuildNetworkRepository(
      sl.get<ApiService>(),
    ),
  );

//! interceptors

  sl.registerFactory<CancelToken>(
    () => CancelToken(),
  );

  sl.registerSingleton<TokenInterceptor>(
    TokenInterceptor(
      sl.get<ILocalStorageRepository>(),
    ),
  );

  sl.registerSingleton<LogInterceptor>(
    LogInterceptor(requestBody: true, responseBody: true),
  );

  sl.registerSingleton<CookieInterceptor>(
    CookieInterceptor(
      sl.get<ILocalStorageRepository>(),
    ),
  );

  sl.registerSingleton<RefreshTokenInterceptor>(
    RefreshTokenInterceptor(
      sl.get<ILocalStorageRepository>(),
      sl.get<IRequestRepository>(),
      ApiHelperCore.urlCrumbIssuer,
    ),
  );
}
