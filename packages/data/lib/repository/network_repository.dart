import 'package:data/core/api_key.dart';
import 'package:data/repository/api_base_repository.dart';
import 'package:data/service/api_service.dart';
import 'package:dio/dio.dart';

import 'package:domain/model/auth/api_authorization_response.dart';
import 'package:domain/repository/network_repository.dart';
import 'package:domain/model/auth/authorization_exception.dart';

class NetworkRepository extends ApiBaseRepositoryImpl
    implements INetworkRepository {
  final ApiService _service;
  final CancelToken _cancelToken;

  NetworkRepository(
    this._service,
    this._cancelToken,
  ) : super(cancelToken: _cancelToken);

  @override
  Future<ApiAuthorizationResponse?> login() {
    return _service
        .get(
          path: ApiHelperCore.pathToken,
          cancelToken: _cancelToken,
        )
        .then(
          (value) => Future.value(
            ApiAuthorizationResponse.fromJson(value.data),
          ),
        )
        .onError(
      (error, stackTrace) {
        if (error is DioError && error.response?.statusCode == 401) {
          return Future.error(
            AuthException(
              "login invalid",
              "password invalid",
            ),
          );
        } else {
          return Future.error(error!);
        }
      },
    );
  }

  @override
  Future<ApiAuthorizationResponse?> getJobsByView(String url) {
    return _service
        .get(
          path: url + ApiHelperCore.pathToken,
        )
        .then(
          (response) => Future.value(
            ApiAuthorizationResponse.fromJson(response.data),
          ),
        );
  }
}
