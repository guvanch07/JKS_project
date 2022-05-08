import 'dart:io';

import 'package:dio/dio.dart';
import 'package:domain/core/extension/string_extention.dart';
import 'package:domain/repository/local_storage_repository.dart';

class CookieInterceptor extends Interceptor {
  final ILocalStorageRepository _localStorageRepository;

  CookieInterceptor(this._localStorageRepository);

  @override
  void onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    options.headers[HttpHeaders.cookieHeader] =
        await _localStorageRepository.getCookie();

    return super.onRequest(options, handler);
  }

  @override
  void onError(
    DioError err,
    ErrorInterceptorHandler handler,
  ) async {
    if (err.response?.statusCode == 401) {
      await _localStorageRepository.deleteCookie();
    }

    return super.onError(err, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) async {
    if (response.statusCode == 200) {
      final cookie = response.headers.map[HttpHeaders.setCookieHeader]?.first;

      await _localStorageRepository.setCookie(cookie.orEmpty);
    }
    super.onResponse(response, handler);
  }
}
