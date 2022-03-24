import 'dart:convert';
import 'package:domain/model/base_auth.dart';

class ApiAuthorizationResponse implements AuthorizationResponse {
  @override
  final List<dynamic>? data;
  ApiAuthorizationResponse(this.data);

  static ApiAuthorizationResponse? fromJson(dynamic data) {
    if (data == null || data.isEmpty) {
      return null;
    }
    var jsonData = data;
    if (data is String) {
      jsonData = json.decode(data);
    }

    return ApiAuthorizationResponse(jsonData["jobs"]);
  }
}
