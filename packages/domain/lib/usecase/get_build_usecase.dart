import 'dart:developer';

import 'package:domain/core/exception/exceptions.dart';
import 'package:domain/model/propery/property.dart';
import 'package:domain/repository/base_network_repository.dart';
import 'package:domain/repository/local_db_repository.dart';
import 'package:domain/usecase/base_usecase.dart';

class BuildUseCase implements UseCaseParams<String, Future<List<Property>?>> {
  final INetworkRepository _repository;
  final ILocalDBRepository _local;

  BuildUseCase(this._repository, this._local);

  @override
  Future<List<Property>?> call(String name) async {
    try {
      final propertyBuild = await _repository.getJobsProperty(name);
      if (propertyBuild != null) {
        _local.setLocalDBProperties(name, propertyBuild);
      }
      return propertyBuild;
    } catch (e) {
      try {
        return await _local.getBuildResponseFromDB(name);
      } catch (e) {
        log(e.toString());
      }
      throw CacheException(message: e.toString());
    }
  }

  @override
  void dispose() {
    _repository.dispose();
  }
}
