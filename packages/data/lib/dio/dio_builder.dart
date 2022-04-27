import 'package:dio/dio.dart';

Dio dioBuilder(
  String baseUrl,
  List<Interceptor> listOfInterseptors, {
  Map<String, dynamic>? headers,
}) {
  const timeout = 60000;
  final headersMap = headers ?? <String, dynamic>{};

  final options = BaseOptions(
    baseUrl: baseUrl,
    connectTimeout: timeout,
    receiveTimeout: timeout,
    sendTimeout: timeout,
    headers: headersMap,
    contentType: 'application/json',
  );

  final dio = Dio(options);
  dio.interceptors.addAll(listOfInterseptors);

  return dio;
}
