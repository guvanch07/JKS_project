import 'dart:io';
import 'package:dio/dio.dart';

Dio dioBuilder(String baseUrl, {Map<String, dynamic>? headers}) {
  const timeOut = 60000;
  final headersMap = headers ?? <String, dynamic>{};
  headersMap[HttpHeaders.userAgentHeader] =
      "${Platform.operatingSystem} = APPLICATION".toUpperCase();
  final options = BaseOptions(
    baseUrl: baseUrl,
    connectTimeout: timeOut,
    receiveTimeout: timeOut,
    sendTimeout: timeOut,
    headers: headersMap,
    contentType: 'application/json',
  );

  final dio = Dio(options);
  dio.interceptors.add(LogInterceptor(requestBody: true, responseBody: true));
  return dio;
}
