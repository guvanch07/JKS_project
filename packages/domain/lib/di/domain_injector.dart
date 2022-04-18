import 'package:domain/model/auth_response_cache.dart';
import 'package:domain/repository/local_base_repo.dart';
import 'package:domain/repository/network_repository.dart';
import 'package:domain/usecase/get_primary_use_case.dart';
import 'package:domain/usecase/get_views_usecase.dart';
import 'package:domain/usecase/home_usecase.dart';
import 'package:domain/usecase/login_usecase.dart';
import 'package:domain/usecase/token_usecase.dart';
import 'package:domain/usecase/validation_usecase.dart';
import 'package:domain/validator/login_step_validation_schema.dart';
import 'package:get_it/get_it.dart';

Future<void> initDomainModule() async {
  final sl = GetIt.I;

  sl.registerSingleton<AuthorizationResponseCache>(
    AuthorizationResponseCache(),
  );

  sl.registerSingleton<LoginValidation>(
    LoginValidation(),
  );

  sl.registerFactory(
    () => LoginUseCase(
      sl.get<INetworkRepository>(),
      sl.get<AuthorizationResponseCache>(),
      sl.get<ILocalStorageRepo>(),
    ),
  );

  sl.registerFactory(
    () => HomeUseCase(
      sl.get<INetworkRepository>(),
      sl.get<AuthorizationResponseCache>(),
    ),
  );

  sl.registerFactory(
    () => LoginValidationUseCase(
      sl.get<LoginValidation>(),
    ),
  );

  sl.registerFactory(() => TokenUseCase(sl.get<ILocalStorageRepo>()));

  sl.registerFactory(() => GetViewsUseCase(
      sl.get<INetworkRepository>(), sl.get<AuthorizationResponseCache>()));

  sl.registerFactory(
      () => GetPrimaryViewUseCase(sl.get<AuthorizationResponseCache>()));
}
