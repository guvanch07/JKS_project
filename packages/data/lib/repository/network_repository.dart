import 'package:data/core/api_key.dart';
import 'package:data/service/api_service.dart';
import 'package:dio/dio.dart';
import 'package:domain/model/api_registration_response.dart';
import 'package:domain/repository/network_repository.dart';

import 'api_base_repository.dart';

class NetworkRepository extends ApiBaseRepositoryImpl
    implements INetworkRepository {
  final ApiService _service;
  final CancelToken _cancelToken;

  NetworkRepository(
    this._service,
    this._cancelToken,
  ) : super(cancelToken: _cancelToken);

  @override
  Future<CardModel> getJobs() => _service
      .get(
        path: ApiHelperCore.pathUrl,
        cancelToken: _cancelToken,
      )
      .then(
        (value) => Future.value(CardModel.fromJson(value.data)),
      );
}
