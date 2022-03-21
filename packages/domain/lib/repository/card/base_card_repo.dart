import 'package:domain/core.domain/core.usecase/base_repository.dart';
import 'package:domain/entities/card/api_model.dart';

abstract class BaseCardRepository implements BaseRepository {
  @override
  void dispose() {}
  Future<CardModel> getCard();
}
