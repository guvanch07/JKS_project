import 'package:domain/model/auth/api_authorization_response.dart';

import 'package:domain/model/propery/post_model.dart';

import 'base_repository.dart';

abstract class INetworkRepository implements BaseRepository {
  Future<ApiAuthorizationResponse?> login();
  Future<ApiAuthorizationResponse?> getJobs(String url);
  Future fetchCrumbData();
  Future fetchBuildData(String url);
  Future<bool> sendBuildData(PostRequestModel postRequestModel);
  Future<dynamic> request({
    required String path,
    String? method,
    Map<String, dynamic>? headers,
  });
}
