import 'dart:io';
import 'package:data/service/error_handler.dart';
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
    headers: headers, //!headersMap
    contentType: 'application/json',
  );

  final dio = Dio(options);
  dio.interceptors.addAll(
      [LogInterceptor(requestBody: true, responseBody: true), ErrorHandler()]);
  return dio;
}
