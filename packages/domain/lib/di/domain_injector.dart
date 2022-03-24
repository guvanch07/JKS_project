import 'package:domain/model/list_jobs_to_chache.dart';
import 'package:domain/repository/network_repository.dart';
import 'package:domain/usecase/get_registration_use_case.dart';
import 'package:get_it/get_it.dart';

Future<void> initDomainModule() async {
  final sl = GetIt.I;

  sl.registerSingleton<JobsToCache>(
    JobsToCache(),
  );

  sl.registerFactory(
    () => LoginStepUseCase(
      sl.get<INetworkRepository>(),
      sl.get<JobsToCache>(),
    ),
  );
}
