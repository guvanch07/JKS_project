import 'package:dio/dio.dart';

class ErrorHandler extends InterceptorsWrapper {
  @override
  void onError(DioError err, ErrorInterceptorHandler handler) {
    if (err.response?.statusCode == 403) {}
  }
}
