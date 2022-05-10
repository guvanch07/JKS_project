import 'package:domain/model/auth/api_authorization_response.dart';
import 'package:domain/model/job/build_jobs_jenkis.dart';
import 'package:domain/model/propery/api_property.dart';
import 'base_repository.dart';

abstract class INetworkRepository implements BaseRepository {
  Future<ApiAuthorizationResponse?> login();
  Future<ApiAuthorizationResponse?> getJobs(String url);
  Future<ApiPropertyResponse?> getJobsProperty(String url);
  Future<bool> isBuildPosted(BuildPostModel data);
  Future<dynamic> request({
    required String path,
    String? method,
    Map<String, dynamic>? headers,
  });
}
