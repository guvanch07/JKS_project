import 'package:domain/repository/cookie_repository.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CookieStorageRepository implements ICookieRepository {
  final SharedPreferences _prefs;
  static const tokenKey = 'token';

  CookieStorageRepository(this._prefs);

  @override
  Future<String?> getCookie() async => _prefs.getString(tokenKey);

  @override
  Future<bool> setCookie(String token) async => _prefs.setString(
        tokenKey,
        token,
      );

  @override
  Future<void> deleteCookie() async => _prefs.remove(tokenKey);

  @override
  void dispose() {}
}
