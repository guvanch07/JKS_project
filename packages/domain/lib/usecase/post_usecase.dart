import 'package:domain/model/propery/property_response_cahce.dart';
import 'package:domain/repository/build_network_repository.dart';
import 'package:domain/usecase/base_usecase.dart';

class BuildUseCase
    implements UseCaseParams<String, Future<Map<String, dynamic>?>> {
  final IBuildNetworkRepository _repository;
  final PropertyResponseCache _cache;

  BuildUseCase(this._repository, this._cache);

  @override
  Future<Map<String, dynamic>?> call(String name) async {
    return null;
  }

  @override
  void dispose() {
    _repository.dispose();
  }
}
