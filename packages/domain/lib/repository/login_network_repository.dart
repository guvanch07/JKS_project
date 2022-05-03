import 'package:domain/model/auth/api_authorization_response.dart';
import 'base_repository.dart';

abstract class ILoginNetworkRepository implements BaseRepository {
  Future<ApiAuthorizationResponse?> login();
  Future<ApiAuthorizationResponse?> getJobs(String url);
}
