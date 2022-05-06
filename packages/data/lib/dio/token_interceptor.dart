import 'package:dio/dio.dart';
import 'package:domain/repository/token_repository.dart';

class TokenInterceptor extends Interceptor {
  final ITokenStorageRepository _localStorageRepository;

  TokenInterceptor(this._localStorageRepository);

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
}
