import 'package:dio/dio.dart';
import 'package:domain/repository/interceptor_proxy.dart';

class InterceptorProxy implements IInterceptorProxy {
  final Dio _dio;
  final List<Interceptor> _interceptors;
  InterceptorProxy(
    this._dio,
    this._interceptors,
  );

  @override
  void interceptorProxy() {
    _dio.interceptors.addAll(_interceptors);
  }
}
