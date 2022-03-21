import 'package:data/service/api_service.dart';
import 'package:dio/dio.dart';
import 'package:domain/entities/card/api_model.dart';
import 'package:domain/repository/card/base_card_repo.dart';
import 'package:data/repository/login/api_base_repository.dart';

class CardNetworkRepository extends ApiBaseRepositoryImpl
    implements BaseCardRepository {
  final ApiService _service;
  final CancelToken _cancelToken;

  CardNetworkRepository(this._service, this._cancelToken);

  @override
  Future<CardModel> getCard() {
    return _service
        .get(
          path: 'http://jenkins-mobile.moneyman.ru/api/json?pretty=true',
          cancelToken: _cancelToken,
        )
        .then((value) => Future.value(CardModel.fromJson(value.data)));
  }
}
