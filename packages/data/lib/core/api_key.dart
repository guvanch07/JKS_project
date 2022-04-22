import 'dart:convert';

abstract class ApiHelperCore {
  static const String baseUrl = "http://jenkins-mobile.moneyman.ru/";
  static const String pathUrl = "/api/json?pretty=true";
  static const String password = "1Aa_Bb";
  static const String login = "flutter_lab_test";
  static const String pathToken = "api/json";
  static const tokenKey = 'token';
  static Map<String, dynamic> authHeader = {
    "Authorization": "Basic ${base64.encode(utf8.encode("$login:$password"))}"
  };
}
