import 'package:dio/dio.dart';
import 'package:domain/repository/local_base_repo.dart';

class TokenManager extends Interceptor {
  final ILocalStorageRepo _localStorageRepository;

  TokenManager(this._localStorageRepository);

  @override
  void onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    options.headers['Authorization'] = await _localStorageRepository.getToken();
    return super.onRequest(options, handler);
  }

  @override
  void onError(
    DioError err,
    ErrorInterceptorHandler handler,
  ) async {
    if (err.response?.statusCode == 401) {
      await _localStorageRepository.deleteToken();
    }
    return super.onError(err, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    if (response.statusCode == 200) {
      var data = Map<String, dynamic>.from(response.data);

      if (data["token"] != null) {
        //!save token
        _localStorageRepository.saveToken(data.values.toString());
      } else if (response.statusCode == 401) {
        _localStorageRepository.deleteToken();
      }
    }
    super.onResponse(response, handler);
  }
}
