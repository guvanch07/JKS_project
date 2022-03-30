import 'package:data/core/api_key.dart';
import 'package:data/dio/dio_builder.dart';
import 'package:data/repository/network_repository.dart';
import 'package:data/service/api_service.dart';
import 'package:dio/dio.dart';
import 'package:domain/repository/network_repository.dart';
import 'package:get_it/get_it.dart';

Future<void> initDataModule() async {
  final sl = GetIt.I;

  sl.registerFactory<CancelToken>(
    () => CancelToken(),
  );

  sl.registerSingleton<Dio>(
    dioBuilder(
      ApiHelperCore.baseUrl,
      headers: ApiHelperCore.authHeader,
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
