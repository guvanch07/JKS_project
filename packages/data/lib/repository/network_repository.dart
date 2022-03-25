import 'package:data/core/api_key.dart';
import 'package:data/core/error_const.dart';
import 'package:data/models/auth_exception.dart';
import 'package:data/service/api_service.dart';
import 'package:dio/dio.dart';
import 'package:domain/model/api_auth_response.dart';
import 'package:domain/repository/network_repository.dart';

import 'api_base_repository.dart';

class NetworkRepository extends ApiBaseRepositoryImpl
    implements INetworkRepository {
  final ApiService _service;
  final CancelToken _cancelToken;

  NetworkRepository(
    this._service,
    this._cancelToken,
  ) : super(cancelToken: _cancelToken);

  @override
  ApiAuthorizationResponse? getdata;

  @override
  Future<ApiAuthorizationResponse?> getJobs() => _service
          .get(
        path: ApiHelperCore.pathUrl,
        cancelToken: _cancelToken,
      )
          .then((value) {
        getdata = ApiAuthorizationResponse.fromJson(value.data);
        return Future.value(getdata);
      }).onError((error, stackTrace) {
        if (error is DioError && error.response?.statusCode == 401) {
          return Future.error(AuthException(
              ErrorTextField.loginInvalid, ErrorTextField.passwordInvalid));
        } else {
          return Future.error(error!);
        }
      });
}
