import 'package:domain/model/propery/property.dart';
import 'package:domain/model/propery/property_response_cahce.dart';
import 'package:domain/repository/base_network_repository.dart';
import 'package:domain/usecase/base_usecase.dart';

class BuildUseCase implements UseCaseParams<String, Future<List<Property>?>> {
  final INetworkRepository _repository;
  final PropertyResponseCache _cache;

  BuildUseCase(this._repository, this._cache);

  @override
  Future<List<Property>?> call(String name) async {
    return _cache.property ??
        await _repository.getJobsProperty(name).then(
          (response) {
            final property = response?.jobProperty
                ?.map((e) => Property.fromJson(e))
                .toList();

            _cache.property = property;
            return property;
          },
        );
  }

  @override
  void dispose() {
    _repository.dispose();
  }
}
