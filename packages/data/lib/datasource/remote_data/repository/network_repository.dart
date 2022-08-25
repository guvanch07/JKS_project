import 'package:data/core/api_key.dart';
import 'package:data/datasource/remote_data/repository/api_base_repository.dart';
import 'package:data/service/api_service.dart';
import 'package:dio/dio.dart';

import 'package:domain/model/auth/api_authorization_response.dart';
import 'package:domain/model/propery/api_build_models.dart';
import 'package:domain/model/propery/api_crumb.dart';
import 'package:domain/model/propery/post_model.dart';
import 'package:domain/repository/base_network_repository.dart';
import 'package:domain/model/auth/authorization_exception.dart';

class NetworkRepository extends ApiBaseRepositoryImpl
    implements INetworkRepository {
  final ApiService _service;

  NetworkRepository(
    this._service,
  ) : super();

  @override
  Future<ApiAuthorizationResponse?> login() {
    return _service
        .get(
          path: ApiHelperCore.dataPath,
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
          path: url + ApiHelperCore.dataPath,
        )
        .then(
          (response) => Future.value(
            ApiAuthorizationResponse.fromJson(response.data),
          ),
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

  @override
  Future fetchBuildData(String url) {
    return _service
        .get(
      path: ApiHelperCore.getBuildDataPath(url),
    )
        .then(
      (response) {
        return Future.value(
          ApiBuildDataModel.fromJson(response.data),
        );
      },
    );
  }

  @override
  Future fetchCrumbData() {
    return _service
        .get(
          path: ApiHelperCore.crumbPath,
        )
        .then(
          (response) => Future.value(
            ApiCrumbResponseModel.fromJson(response.data),
          ),
        );
  }

  @override
  Future<bool> sendBuildData(PostRequestModel postRequestModel) {
    return _service
        .post(
          path: ApiHelperCore.getBuildJobUrl(
            viewName: postRequestModel.jobView,
            jobName: postRequestModel.jobName,
          ),
          queryParameters: postRequestModel.getQueryParameters,
        )
        .then(
          (response) => true,
        );
  }
}
