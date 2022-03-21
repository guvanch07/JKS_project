import 'package:domain/entities/card/api_model.dart';

class CardHomeData {
  CardModel? cardModel;
  CardHomeData(this.cardModel);
  factory CardHomeData.init() => CardHomeData(null); // ! why is here is null?
  CardHomeData copy() => CardHomeData(cardModel);
}
