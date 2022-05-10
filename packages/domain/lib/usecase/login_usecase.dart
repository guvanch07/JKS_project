import 'dart:convert';
import 'package:domain/model/auth/authorization_response_cache.dart';
import 'package:domain/model/job/job_model.dart';
import 'package:domain/model/params/login_step_fields.dart';
import 'package:domain/repository/local_storage_repository.dart';
import 'package:domain/repository/base_network_repository.dart';
import 'package:domain/usecase/base_usecase.dart';

class LoginUseCase implements UseCaseParams<LoginParams, Future<void>> {
  final INetworkRepository _networkRepository;
  final ILocalStorageRepository _localStorageRepository;
  final AuthorizationResponseCache _cache;

  LoginUseCase(
    this._networkRepository,
    this._localStorageRepository,
    this._cache,
  );

  @override
  Future<void> call(LoginParams params) async {
    String token = 'Basic ' +
        base64.encode(
          utf8.encode(
            (params.login ?? "") + ':' + (params.password ?? ""),
          ),
        );

    await _localStorageRepository.setToken(token);

    await _networkRepository.login().then((response) {
      _cache.jobs = response?.jobData?.map((e) => Job.fromJson(e)).toList();
    });
  }

  @override
  void dispose() {
    _networkRepository.dispose();
    _localStorageRepository.dispose();
  }
}
