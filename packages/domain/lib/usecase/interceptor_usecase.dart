import 'package:domain/repository/interceptor_proxy.dart';
import 'package:domain/usecase/base_usecase.dart';

class InterceptorUseCase extends UseCase<void> {
  final IInterceptorProxy _interceptorProvider;

  InterceptorUseCase(this._interceptorProvider);

  @override
  void call() {
    _interceptorProvider.interceptorProxy();
  }

  @override
  void dispose() {}
}
