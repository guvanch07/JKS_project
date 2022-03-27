import 'package:domain/model/api_registration_response.dart';

class HomeData {
  CardModel? fetchingData;
  HomeData(
    this.fetchingData,
  );
  factory HomeData.init() => HomeData(null);
  HomeData copy() => HomeData(
        fetchingData,
      );
}
