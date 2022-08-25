import 'package:dio/dio.dart';

import 'package:domain/repository/base_network_repository.dart';
import 'package:domain/model/propery/api_crumb.dart';
import 'package:domain/repository/local_storage_repository.dart';

class CrumbInterceptor extends Interceptor {
  final ILocalRepository _localRepository;
  final INetworkRepository _networkRepository;

  CrumbInterceptor(
    this._localRepository,
    this._networkRepository,
  );

  @override
  void onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    options.headers['Jenkins-Crumb'] = await _localRepository.getCrumb();
    super.onRequest(options, handler);
  }

  @override
  void onError(
    DioError error,
    ErrorInterceptorHandler handler,
  ) async {
    if (error.response?.statusCode == 403) {
      final ApiCrumbResponseModel crumbResponse =
          await _networkRepository.fetchCrumbData();

      await _localRepository.saveCrumb(crumbResponse.crumb ?? '');

      await _networkRepository.request(
        path: error.requestOptions.path,
        method: error.requestOptions.method,
        headers: error.requestOptions.headers,
      );
    }

    super.onError(error, handler);
  }
}
