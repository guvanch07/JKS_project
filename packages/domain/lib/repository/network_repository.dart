import 'package:domain/model/api_registration_response.dart';

import 'base_repository.dart';

abstract class INetworkRepository implements BaseRepository {
  Future<CardModel> getJobs();
}
