import 'package:domain/model/auth/api_authorization_response.dart';
import 'base_repository.dart';

abstract class INetworkRepository implements BaseRepository {
  Future<ApiAuthorizationResponse?> login();

  Future<ApiAuthorizationResponse?> getJobsByView(String url);
}
