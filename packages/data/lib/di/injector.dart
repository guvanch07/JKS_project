import 'package:data/core/api_key.dart';
import 'package:data/datasource/locally_data/db/data_base.dart';
import 'package:data/datasource/locally_data/init/database_sql.dart';
import 'package:data/datasource/remote_data/mapper/property_mapper.dart';
import 'package:data/dio/dio_builder.dart';
import 'package:data/dio/intercepters/cookie_interceptor.dart';
import 'package:data/dio/intercepters/crumb_interceptor.dart';
import 'package:data/dio/intercepters/auth_interceptor.dart';
import 'package:data/datasource/locally_data/repository/local_storage_repository.dart';
import 'package:data/datasource/remote_data/repository/network_repository.dart';

import 'package:data/service/api_service.dart';
import 'package:sqflite/sqflite.dart';
import 'package:dio/dio.dart';
import 'package:domain/repository/base_network_repository.dart';
import 'package:domain/repository/local_storage_repository.dart';

import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<void> injectDataModule(GetIt sl) async {
  sl.registerSingleton<SharedPreferences>(
    await SharedPreferences.getInstance(),
  );

  sl.registerSingleton<Database>(
    await InitDataBase().database,
  );

  sl.registerSingleton<SqfliteDatabase>(
    SqfliteDatabase(
      db: sl.get<Database>(),
    ),
  );

  sl.registerSingleton<ILocalRepository>(
    LocalRepository(
      sl.get<SharedPreferences>(),
      sl.get<SqfliteDatabase>(),
    ),
  );

  GetIt.I.registerSingleton<LogInterceptor>(
    LogInterceptor(
      requestBody: true,
      responseBody: true,
    ),
  );

  sl.registerSingleton<AuthInterceptor>(
    AuthInterceptor(
      sl.get<ILocalRepository>(),
    ),
  );

  sl.registerSingleton<CookieInterceptor>(
    CookieInterceptor(
      sl.get<ILocalRepository>(),
    ),
  );

  sl.registerSingleton<Dio>(
    dioBuilder(ApiHelperCore.baseUrl),
  );

  sl.registerSingleton<ApiService>(
    ApiService(sl.get<Dio>()),
  );

  sl.registerLazySingleton<INetworkRepository>(
    () => NetworkRepository(
      sl.get<ApiService>(),
    ),
  );

  sl.registerSingleton<CrumbInterceptor>(
    CrumbInterceptor(
      sl.get<ILocalRepository>(),
      sl.get<INetworkRepository>(),
    ),
  );

  sl.get<ApiService>().addInterceptor(
    interceptors: [
      sl.get<AuthInterceptor>(),
      sl.get<CrumbInterceptor>(),
      sl.get<CookieInterceptor>(),
      sl.get<LogInterceptor>(),
    ],
  );

  //!mapper

  sl.registerSingleton<PropertyApiMapper>(
    PropertyApiMapper(),
  );
}
