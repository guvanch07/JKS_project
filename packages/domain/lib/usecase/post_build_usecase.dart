import 'package:domain/model/propery/post_model.dart';
import 'package:domain/repository/base_network_repository.dart';
import 'package:domain/usecase/base_usecase.dart';

class BuildJenkisUseCase
    implements UseCaseParams<PostRequestModel, Future<bool>> {
  final INetworkRepository _repository;

  BuildJenkisUseCase(
    this._repository,
  );

  @override
  Future<bool> call(PostRequestModel postModel) async {
    return _repository.sendBuildData(postModel);
  }

  @override
  void dispose() {
    _repository.dispose();
  }
}
