import 'dart:convert';

import 'package:domain/model/base_models/base_post.dart';

class PostResponse implements BasePostResponse {
  @override
  final String inputOne;

  @override
  final String inputTwo;
  PostResponse(
    this.inputOne,
    this.inputTwo,
  );

  static PostResponse? toJson(dynamic data) {
    if (data == null || data.isEmpty) {
      return null;
    }
    var jsonData = data;
    if (data is String) {
      jsonData = json.encode(data); //! encode
    }

    return PostResponse(
      jsonData["jobs"],
      jsonData["views"],
    );
  }
}
