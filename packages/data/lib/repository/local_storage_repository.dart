import 'package:data/core/api_key.dart';
import 'package:domain/repository/local_storage_repository.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LocalStorageRepository implements ILocalStorageRepository {
  final SharedPreferences _prefs;
  static const cookieKey = 'cookie';
  static const tokenKey = 'token';

  LocalStorageRepository(this._prefs);

  @override
  Future<String?> getToken() async => _prefs.getString(tokenKey);

  @override
  Future<bool> setToken(String cookie) async => _prefs.setString(
        tokenKey,
        cookie,
      );

  @override
  Future<void> deleteToken() async => _prefs.remove(tokenKey);

  @override
  Future<String?> getCookie() async => _prefs.getString(cookieKey);

  @override
  Future<String?> getCrumbRequestField() async =>
      _prefs.getString(ApiHelperCore.crumbRequestField);

  @override
  Future<String?> getLogin() async => _prefs.getString(ApiHelperCore.loginName);

  @override
  Future<String?> getPassword() async =>
      _prefs.getString(ApiHelperCore.passwordName);

  @override
  Future<bool> setCookie(String cookie) async =>
      _prefs.setString(cookieKey, cookie);

  @override
  Future<void> setCrumbRequestField(String crumbRequestField) =>
      _prefs.setString(
        ApiHelperCore.crumbRequestField,
        crumbRequestField,
      );

  @override
  Future<void> deleteCookie() async => _prefs.remove(cookieKey);

  @override
  Future<void> setLogin(String login) => _prefs.setString(
        ApiHelperCore.loginName,
        login,
      );

  @override
  Future<void> setPassword(String password) => _prefs.setString(
        ApiHelperCore.passwordName,
        password,
      );

  @override
  Future<void> deleteCrumb() async =>
      _prefs.remove(ApiHelperCore.crumbRequestField);

  @override
  Future<void> deleteLogin() async => _prefs.remove(ApiHelperCore.loginName);

  @override
  Future<void> deletePassword() async =>
      _prefs.remove(ApiHelperCore.passwordName);

  @override
  void dispose() {}
}
