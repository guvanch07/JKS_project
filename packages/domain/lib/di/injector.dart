import 'package:domain/model/auth/authorization_response_cache.dart';
import 'package:domain/model/propery/property_response_cahce.dart';
import 'package:domain/repository/interceptor_proxy.dart';
import 'package:domain/repository/local_storage_repository.dart';
import 'package:domain/repository/base_network_repository.dart';
import 'package:domain/usecase/get_build_usecase.dart';
import 'package:domain/usecase/get_primary_view_usecase.dart';
import 'package:domain/usecase/home_usecase.dart';
import 'package:domain/usecase/interceptor_usecase.dart';
import 'package:domain/usecase/login_usecase.dart';
import 'package:domain/usecase/login_validation_usecase.dart';
import 'package:domain/usecase/post_build_usecase.dart';
import 'package:domain/usecase/token_usecase.dart';
import 'package:domain/validator/login_step_validation_schema.dart';
import 'package:get_it/get_it.dart';
import 'package:domain/usecase/get_views_usecase.dart';

Future<void> injectDomainModule() async {
  final sl = GetIt.I;

//! models
  sl.registerSingleton<AuthorizationResponseCache>(
    AuthorizationResponseCache(),
  );

  sl.registerSingleton<PropertyResponseCache>(
    PropertyResponseCache(),
  );

  sl.registerSingleton<LoginStepValidationSchema>(
    LoginStepValidationSchema(),
  );

//! usecase

  sl.registerFactory(
    () => LoginValidationUseCase(
      sl.get<LoginStepValidationSchema>(),
    ),
  );

  sl.registerFactory(
    () => LoginUseCase(
      sl.get<INetworkRepository>(),
      sl.get<ILocalStorageRepository>(),
      sl.get<AuthorizationResponseCache>(),
    ),
  );

  sl.registerFactory(
    () => BuildUseCase(
      sl.get<INetworkRepository>(),
      sl.get<PropertyResponseCache>(),
    ),
  );

  sl.registerFactory(
    () => BuildJenkisUseCase(
      sl.get<INetworkRepository>(),
    ),
  );

  sl.registerFactory(
    () => TokenUseCase(
      sl.get<ILocalStorageRepository>(),
    ),
  );

  sl.registerFactory(
    () => GetViewsUseCase(
      sl.get<INetworkRepository>(),
      sl.get<AuthorizationResponseCache>(),
    ),
  );

  sl.registerFactory(
    () => GetPrimaryViewUseCase(
      sl.get<AuthorizationResponseCache>(),
    ),
  );

  sl.registerFactory(
    () => HomeUseCase(
      sl.get<INetworkRepository>(),
      sl.get<AuthorizationResponseCache>(),
    ),
  );

  sl.registerSingleton<InterceptorUseCase>(
    InterceptorUseCase(
      sl.get<IInterceptorProxy>(),
    ),
  );
}
