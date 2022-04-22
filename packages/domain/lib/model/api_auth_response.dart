import 'dart:convert';

import 'package:domain/model/base_models/base_auth.dart';

class ApiAuthorizationResponse implements BaseAuthorizationResponse {
  @override
  final List<dynamic>? jobData;

  @override
  final dynamic primaryViewData;

  @override
  final List<dynamic>? viewData;

  ApiAuthorizationResponse(this.jobData, this.primaryViewData, this.viewData);

  static ApiAuthorizationResponse? fromJson(dynamic data) {
    if (data == null || data.isEmpty) {
      return null;
    }
    var jsonData = data;
    if (data is String) {
      jsonData = json.decode(data);
    }

    return ApiAuthorizationResponse(
        jsonData["jobs"], jsonData["views"], jsonData["primaryView"]);
  }
}
