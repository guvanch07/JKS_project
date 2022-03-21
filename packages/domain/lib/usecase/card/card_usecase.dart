import 'package:domain/core.domain/core.usecase/usecase.dart';
import 'package:domain/entities/card/api_model.dart';
import 'package:domain/repository/card/base_card_repo.dart';

class GetCardUseCase implements UseCase<Future<CardModel>> {
  final BaseCardRepository _repository;

  GetCardUseCase(this._repository);

  @override
  Future<CardModel> call() async => _repository.getCard();

  @override
  void dispose() {
    _repository.dispose();
  }
}
