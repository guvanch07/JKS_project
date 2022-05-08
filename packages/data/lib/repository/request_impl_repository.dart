import 'package:data/repository/api_base_repository.dart';
import 'package:data/service/api_service.dart';
import 'package:dio/dio.dart';
import 'package:domain/repository/request_network_repo.dart';

class RequestRepository extends ApiBaseRepositoryImpl
    implements IRequestRepository {
  final ApiService _service;
  RequestRepository(
    this._service,
  );

  @override
  Future request({
    required String path,
    String? method,
    Map<String, dynamic>? headers,
  }) =>
      _service.request(
        path: path,
        options: Options(
          method: method,
          headers: headers,
        ),
      );
}
