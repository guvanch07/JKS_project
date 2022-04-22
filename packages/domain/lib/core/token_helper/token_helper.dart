import 'dart:convert';

abstract class TokenHelperCore {
  static String getAuthToken({String? login, String? password}) {
    String token = 'Basic ' +
        base64.encode(
          utf8.encode(
            (login ?? '') + ':' + (password ?? ''),
          ),
        );

    return token;
  }
}
