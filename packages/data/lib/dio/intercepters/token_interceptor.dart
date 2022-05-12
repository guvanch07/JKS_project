import 'package:dio/dio.dart';
import 'package:domain/repository/local_storage_repository.dart';

class TokenInterceptor extends Interceptor {
  final ILocalStorageRepository _tokenStorageRepository;

  TokenInterceptor(this._tokenStorageRepository);

  @override
  void onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    options.headers['Authorization'] = await _tokenStorageRepository.getToken();

    return super.onRequest(options, handler);
  }

  @override
  void onError(
    DioError err,
    ErrorInterceptorHandler handler,
  ) async {
    if (err.response?.statusCode == 401) {
      await _tokenStorageRepository.deleteToken();
    }

    return super.onError(err, handler);
  }
}
