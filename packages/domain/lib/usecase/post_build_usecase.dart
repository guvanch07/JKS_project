import 'package:domain/model/job/build_jobs_jenkis.dart';
import 'package:domain/repository/base_network_repository.dart';
import 'package:domain/usecase/base_usecase.dart';

class BuildJenkisUseCase
    implements UseCaseParams<BuildPostModel, Future<bool>> {
  final INetworkRepository _repository;

  BuildJenkisUseCase(
    this._repository,
  );

  @override
  Future<bool> call(BuildPostModel postModel) async {
    return _repository.isBuildPosted(postModel);
  }

  @override
  void dispose() {
    _repository.dispose();
  }
}
