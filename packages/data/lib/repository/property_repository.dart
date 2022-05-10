import 'package:data/core/api_key.dart';
import 'package:data/repository/api_base_repository.dart';
import 'package:data/service/api_service.dart';
import 'package:domain/model/job/build_jobs_jenkis.dart';
import 'package:domain/model/propery/api_property.dart';
import 'package:domain/repository/build_network_repository.dart';

class BuildNetworkRepository extends ApiBaseRepositoryImpl
    implements IBuildNetworkRepository {
  final ApiService _service;

  BuildNetworkRepository(this._service);

  @override
  Future<ApiPropertyResponse?> getJobsProperty(String url) {
    return _service
        .get(path: ApiHelperCore.job + url + ApiHelperCore.pathToken)
        .then((response) =>
            Future.value(ApiPropertyResponse.fromJson(response.data)));
  }

  @override
  Future<bool> isBuildPosted(BuildPostModel data) {
    return _service
        .post(
          path: ApiHelperCore.urlBuildToPost(
            data.jobInfoModel.view,
            data.jobInfoModel.job,
          ),
          queryParameters: data.params,
          cancelToken: cancelToken,
        )
        .then(
          (response) => true,
        );
  }
}
