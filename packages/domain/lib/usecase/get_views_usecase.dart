import 'package:domain/model/auth/authorization_response_cache.dart';
import 'package:domain/model/job/job_model.dart';
import 'package:domain/model/views/views_model.dart';
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
      return await _networkRepository.login().then(
        (response) {
          var views =
              response?.viewData?.map((e) => JenkinsView.fromJson(e)).toList();

          views = _sortViewOrder(views);

          _cache.views = views;
          _cache.primaryView = JenkinsView.fromJson(response?.primaryViewData);
          _cache.jobs = response?.jobData?.map((e) => Job.fromJson(e)).toList();

          return views ?? [];
        },
      );
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
  void dispose() {
    _networkRepository.dispose();
  }
}
