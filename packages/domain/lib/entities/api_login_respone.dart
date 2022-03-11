import 'login_response.dart';
import 'dart:convert';

class ApiLoginResponse implements LoginResponse {
  @override
  final Map<String, dynamic>? data;

  @override
  final String? step;

  ApiLoginResponse(this.data, this.step);

  static ApiLoginResponse? fromJson(dynamic data) {
    if (data == null || data.isEmpty) {
      return null;
    }

    var jsonData = data;

    if (data is String) {
      jsonData = json.decode(data);
    }
    return ApiLoginResponse(jsonData["data"], jsonData["step"]);
  }
}
