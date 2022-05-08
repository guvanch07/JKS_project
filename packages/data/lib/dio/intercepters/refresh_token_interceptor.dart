import 'package:data/core/api_key.dart';
import 'package:dio/dio.dart';
import 'package:domain/repository/local_storage_repository.dart';
import 'package:domain/repository/request_network_repo.dart';

class RefreshTokenInterceptor extends Interceptor {
  final ILocalStorageRepository _localStorageRepository;
  final IRequestRepository _requestRepository;
  final String _urlToken;
  RefreshTokenInterceptor(
    this._localStorageRepository,
    this._requestRepository,
    this._urlToken,
  );

  @override
  void onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    final crumbRequest = await _localStorageRepository.getCrumbRequestField();
    final token = await _localStorageRepository.getToken();
    options.headers[crumbRequest ?? ApiHelperCore.jenkinsCrumb] = token;
    super.onRequest(options, handler);
  }

  @override
  void onError(DioError err, ErrorInterceptorHandler handler) async {
    if (err.response?.statusCode == 403) {
      if (await refreshToken()) {
        return handler.resolve(
          await _retry(err.requestOptions),
        );
      }
    } else if (err.response?.statusCode == 401) {
      await _localStorageRepository.deleteCookie();
      await _localStorageRepository.deletePassword();
      await _localStorageRepository.deleteLogin();
      await _localStorageRepository.deleteToken();
    }
    super.onError(err, handler);
  }

  Future<Response<dynamic>> _retry(RequestOptions requestOptions) async {
    return await _requestRepository.request(
      path: requestOptions.path,
      headers: requestOptions.headers,
      method: ApiHelperCore.post,
    );
  }

  Future<bool> refreshToken() async {
    final response = await _requestRepository.request(path: _urlToken);

    if (response.statusCode == 200) {
      final token = response.data[ApiHelperCore.crumb];
      final crumbRequestField = response.data[ApiHelperCore.crumbRequestField];
      await _localStorageRepository.setToken(token);
      await _localStorageRepository.setCrumbRequestField(crumbRequestField);
      return true;
    }
    return false;
  }
}
