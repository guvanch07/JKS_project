import 'package:collection/collection.dart';
import 'package:domain/model/auth/authorization_response_cache.dart';
import 'package:domain/model/job/job_model.dart';
import 'package:domain/repository/network_repository.dart';
import 'package:domain/usecase/base_usecase.dart';

class HomeUseCase implements UseCaseParams<String, Future<List<Job>?>> {
  final INetworkRepository _repository;
  final AuthorizationResponseCache _cache;

  HomeUseCase(this._repository, this._cache);

  @override
  Future<List<Job>?> call(String viewName) async {
    if (viewName == "all") {
      return _cache.jobs ??
          await _repository.login().then(
            (response) {
              final jobs =
                  response?.jobData?.map((e) => Job.fromJson(e)).toList();
              _cache.jobs = jobs;
              return jobs;
            },
          );
    } else {
      final view = _cache.views?.firstWhereOrNull(
        (view) => view.name == viewName,
      );

      return view != null
          ? await _repository.getJobsByView(view.url ?? '').then(
                (response) =>
                    response?.jobData?.map((e) => Job.fromJson(e)).toList(),
              )
          : [];
    }
  }

  @override
  void dispose() {
    _repository.dispose();
  }
}
