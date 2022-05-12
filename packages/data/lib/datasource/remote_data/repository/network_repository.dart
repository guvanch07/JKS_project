import 'package:data/core/api_key.dart';
import 'package:data/datasource/remote_data/mapper/property_mapper.dart';
import 'package:data/datasource/remote_data/repository/api_base_repository.dart';
import 'package:data/service/api_service.dart';
import 'package:dio/dio.dart';

import 'package:domain/model/auth/api_authorization_response.dart';
import 'package:domain/model/job/build_jobs_jenkis.dart';
import 'package:domain/model/propery/property.dart';
import 'package:domain/repository/base_network_repository.dart';
import 'package:domain/model/auth/authorization_exception.dart';

class NetworkRepository extends ApiBaseRepositoryImpl
    implements INetworkRepository {
  final ApiService _service;
  final CancelToken _cancelToken;
  final PropertyApiMapper propertyApiMapper;

  NetworkRepository(
    this._service,
    this._cancelToken,
    this.propertyApiMapper,
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
  Future<ApiAuthorizationResponse?> getJobs(String url) {
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

  @override
  Future<List<Property>?> getJobsProperty(String url) {
    return _service
        .get(path: ApiHelperCore.job + url + ApiHelperCore.pathToken)
        .then(
          (response) => Future.value(
            propertyApiMapper(response.data),
          ),
        );
  }

  @override
  Future<bool> isBuildPosted(BuildPostModel data) {
    return _service
        .post(
          path: ApiHelperCore.urlBuildToPost(
            data.jobInfoModel.view,
            data.jobInfoModel.job,
          ),
          queryParameters: data.params,
          cancelToken: cancelToken,
        )
        .then(
          (response) => true,
        );
  }

  @override
  Future request({
    required String path,
    String? method,
    Map<String, dynamic>? headers,
  }) =>
      _service.request(
        path: path,
        options: Options(
          method: method,
          headers: headers,
        ),
      );
}
