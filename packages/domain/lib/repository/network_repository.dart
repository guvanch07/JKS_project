import 'package:domain/model/api_auth_response.dart';

import 'base_repository.dart';

abstract class INetworkRepository implements BaseRepository {
  Future<ApiAuthorizationResponse?> getJobs();
  ApiAuthorizationResponse? getdata;
}
