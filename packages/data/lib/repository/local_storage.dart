import 'dart:developer';

import 'package:data/core/api_key.dart';
import 'package:domain/repository/base_repository.dart';
import 'package:domain/repository/local_base_repo.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LocalStorageRepository implements ILocalStorageRepo, BaseRepository {
  final SharedPreferences _prefs;
  LocalStorageRepository(
    this._prefs,
  );

  @override
  Future<void> deleteToken() => _prefs.remove(ApiHelperCore.tokenKey);

  @override
  void dispose() {}

  @override
  Future<String?> getToken() async => _prefs.getString(ApiHelperCore.tokenKey);

  @override
  Future<bool> setToken(String token) async =>
      _prefs.setString(ApiHelperCore.tokenKey, token);

  @override
  Future saveToken(String newToken) async {
    String? _token;
    log("new token $newToken");
    if (_token != newToken) {
      _token = newToken;
      _prefs.setString(ApiHelperCore.tokenKey2, _token);
    }
  }
}
