import 'dart:convert';
import 'package:domain/model/base/property_base_response.dart';

class ApiPropertyResponse implements PropertyBaseResponse {
  @override
  final List<dynamic>? jobProperty;

  ApiPropertyResponse(
    this.jobProperty,
  );

  static ApiPropertyResponse? fromJson(dynamic data) {
    if (data == null || data.isEmpty) {
      return null;
    }

    var jsonData = data;
    if (data is String) {
      jsonData = json.decode(data);
    }

    return ApiPropertyResponse(
      jsonData['property'],
    );
  }
}
