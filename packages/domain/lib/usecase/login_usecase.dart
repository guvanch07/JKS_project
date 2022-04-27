import 'dart:convert';

import 'package:domain/model/auth_response_cache.dart';
import 'package:domain/model/job.dart';
import 'package:domain/model/login_parms.dart';
import 'package:domain/repository/local_base_repo.dart';
import 'package:domain/repository/network_repository.dart';

import 'base_usecase.dart';

class LoginUseCase implements UseCaseParams<LoginParms, Future<void>> {
  final INetworkRepository _remoteNetworkingrepository;
  final AuthorizationResponseCache _cache;
  final ILocalStorageRepo _localStorageRepository;

  LoginUseCase(
    this._remoteNetworkingrepository,
    this._cache,
    this._localStorageRepository,
  );

  @override
  Future<void> call(LoginParms params) async {
    final String token = 'Basic ' +
        base64.encode(
          utf8.encode(
            (params.login ?? '') + ':' + (params.password ?? ''),
          ),
        );

    await _localStorageRepository.setToken(token);

    await _remoteNetworkingrepository.login().then((value) {
      _cache.jobs =
          value?.jobData?.map((element) => Job.fromJson(element)).toList();
    });
  }

  @override
  void dispose() {
    _remoteNetworkingrepository.dispose();
    _localStorageRepository.dispose();
  }
}
