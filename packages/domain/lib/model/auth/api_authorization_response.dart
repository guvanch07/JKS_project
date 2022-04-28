import 'dart:convert';
import 'package:domain/model/base/authorization_response.dart';

class ApiAuthorizationResponse implements AuthorizationResponse {
  @override
  final List<dynamic>? jobData;

  @override
  final List<dynamic>? viewData;

  @override
  final dynamic primaryViewData;

  ApiAuthorizationResponse(
    this.jobData,
    this.viewData,
    this.primaryViewData,
  );

  static ApiAuthorizationResponse? fromJson(dynamic data) {
    if (data == null || data.isEmpty) {
      return null;
    }

    var jsonData = data;
    if (data is String) {
      jsonData = json.decode(data);
    }

    return ApiAuthorizationResponse(
      jsonData['jobs'],
      jsonData['views'],
      jsonData['primaryView'],
    );
  }
}
