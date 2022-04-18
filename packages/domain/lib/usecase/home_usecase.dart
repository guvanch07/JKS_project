import 'package:domain/model/auth_response_cache.dart';
import 'package:domain/model/job.dart';
import 'package:domain/repository/network_repository.dart';
import 'package:domain/usecase/base_usecase.dart';
import 'package:collection/collection.dart';

class HomeUseCase implements UseCaseParams<String, Future<List<Job>?>> {
  final INetworkRepository _remoteNetworkingRepository;
  final AuthorizationResponseCache _cache;

  HomeUseCase(
    this._remoteNetworkingRepository,
    this._cache,
  );

  @override
  Future<List<Job>?> call(String viewName) async {
    if (viewName == "all") {
      final jobPoint = await _remoteNetworkingRepository.login().then((value) {
        final jobs = value?.jobData?.map((data) => Job.fromJson(data)).toList();
        _cache.jobs = jobs;
        return jobs;
      });
      return _cache.jobs ?? jobPoint; //!returning
    } else {
      final view =
          _cache.views?.firstWhereOrNull((element) => element.name == viewName);

      return view != null
          ? await _remoteNetworkingRepository.getJobs(view.url ?? "").then(
              (value) =>
                  value?.jobData?.map((data) => Job.fromJson(data)).toList())
          : [];
    }
  }

  @override
  void dispose() {
    _remoteNetworkingRepository.dispose();
  }
}
