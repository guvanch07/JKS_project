import 'package:dio/dio.dart';
import 'package:domain/repository/local_storage_repository.dart';

class CookieInterceptor extends Interceptor {
  final ILocalStorageRepository _localStorageRepository;

  CookieInterceptor(this._localStorageRepository);

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
  void onResponse(Response response, ResponseInterceptorHandler handler) async {
    if (response.statusCode == 200) {
      if (response.headers.map["set-cookie"] != null) {
        //! save cookie
        await _localStorageRepository.setToken("set-cookie");
      }
    }
    super.onResponse(response, handler);
  }
}
