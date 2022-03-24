import 'package:domain/model/job.dart';
import 'package:domain/model/login_step_field.dart';
import 'package:domain/repository/network_repository.dart';
import 'package:domain/model/list_jobs_to_chache.dart';

import 'usecase.dart';

class LoginStepUseCase implements UseCaseParams<LoginParms, Future<void>> {
  final INetworkRepository _repository;
  final JobsToCache _cache;

  LoginStepUseCase(
    this._repository,
    this._cache,
  );

  @override
  Future<void> call(LoginParms parms) async =>
      _repository.getJobs().then((value) {
        _cache.jobs =
            value!.data?.map((element) => Job.fromJson(element)).toList();
      });

  @override
  void dispose() {
    _repository.dispose();
  }
}
