import 'package:domain/model/auth_response_cache.dart';
import 'package:domain/model/job.dart';
import 'package:domain/repository/network_repository.dart';
import 'package:domain/usecase/base_usecase.dart';

class GetViewsUseCase implements UseCase<Future<List<JenkinsView>>> {
  final INetworkRepository _networkRepository;
  final AuthorizationResponseCache _cache;
  GetViewsUseCase(
    this._networkRepository,
    this._cache,
  );
  @override
  Future<List<JenkinsView>> call() async {
    if (_cache.views != null) {
      return _cache.views ?? [];
    } else {
      return await _networkRepository.login().then((value) {
        var views =
            value?.viewData?.map((data) => JenkinsView.fromJson(data)).toList();

        views = _sortViewOrder(views);

        _cache.views = views;
        _cache.primaryView = JenkinsView.fromJson(value?.primaryViewData);
        _cache.jobs =
            value?.jobData?.map((data) => Job.fromJson(data)).toList();

        return views ?? [];
      });
    }
  }

  List<JenkinsView>? _sortViewOrder(List<JenkinsView>? views) {
    if (views != null && views.length > 1) {
      var allViewIndex = views.indexWhere((view) => view.name == 'all');

      if (allViewIndex != -1) {
        var allView = views[allViewIndex];
        views.remove(allView);
        views.insert(0, allView);
      }
    }
    return views;
  }

  @override
  void dispose() {}
}
