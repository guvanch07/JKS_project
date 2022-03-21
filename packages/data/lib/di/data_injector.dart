import 'package:data/core/api_key_helpers.dart';
import 'package:data/repository/card/network_card_repo_impl.dart';
import 'package:data/repository/login/network_repository.dart';
import 'package:data/service/api_service.dart';
import 'package:dio/dio.dart';
import 'package:domain/repository/card/base_card_repo.dart';
import 'package:domain/repository/login/login_repositoy.dart';
import 'package:get_it/get_it.dart';

import '../dio/dio_builder.dart';

Future<void> initDataModule() async {
  _initRepositoryModule();
  _initApiModule();
  _initCardRepositoryModule();
}

void _initApiModule() {
  GetIt.I.registerFactory<CancelToken>(() => CancelToken());
  _initDioModule();
  _initServiceModule();
}

//! login di
void _initRepositoryModule() {
  GetIt.I.registerFactory<LoginRepository>(
    () => NetworkRepository(
      GetIt.I.get<ApiService>(),
      GetIt.I.get<CancelToken>(),
    ),
  );
}

//! card di
void _initCardRepositoryModule() {
  GetIt.I.registerFactory<BaseCardRepository>(
    () => CardNetworkRepository(
      GetIt.I.get<ApiService>(),
      GetIt.I.get<CancelToken>(),
    ),
  );
}

//! dio builder
void _initDioModule() {
  GetIt.I.registerSingleton(
    dioBuilder(ApiHelperCore.baseUrl, headers: ApiHelperCore.authHeader),
    instanceName: "infoBlocksApi",
  );
}

void _initServiceModule() {
  GetIt.I.registerSingleton(
    ApiService(GetIt.I.get<Dio>(instanceName: "infoBlocksApi")),
  );
}
