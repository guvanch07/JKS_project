import 'package:data/repository/login/api_base_repository.dart';
import 'package:data/service/api_service.dart';
import 'package:dio/dio.dart';
import 'package:domain/entities/login/crumb/clumber.dart';
import 'package:domain/repository/login/crumb_repository.dart';

class CrumbNetworking extends ApiBaseRepositoryImpl implements CrumbRepository {
  final ApiService _service;
  final CancelToken _cancelToken;
  CrumbNetworking(
    this._service,
    this._cancelToken,
  );

  @override
  Future<Crumb> getCrumb() {
    return _service
        .get(
          path: "http://jenkins-mobile.moneyman.ru/crumbIssuer/api/json",
          cancelToken: _cancelToken,
        )
        .then((value) => Future.value(Crumb.fromJson(value.data)));
  }
}
