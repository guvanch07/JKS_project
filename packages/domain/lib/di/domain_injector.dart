import 'package:domain/model/list_jobs_to_chache.dart';
import 'package:domain/repository/network_repository.dart';
import 'package:domain/usecase/login_usecase.dart';
import 'package:domain/usecase/validation_usecase.dart';
import 'package:domain/validator/login_step_validation_schema.dart';
import 'package:get_it/get_it.dart';

Future<void> initDomainModule() async {
  final sl = GetIt.I;

  sl.registerSingleton<JobsToCache>(
    JobsToCache(),
  );

  sl.registerSingleton<LoginValidation>(
    LoginValidation(),
  );

  sl.registerFactory(
    () => LoginStepUseCase(
      sl.get<INetworkRepository>(),
      sl.get<JobsToCache>(),
    ),
  );

  sl.registerFactory(
    () => LoginValidationUseCase(
      sl.get<LoginValidation>(),
    ),
  );
}
