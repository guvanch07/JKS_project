import 'package:domain/repository/token_repository.dart';
import 'package:shared_preferences/shared_preferences.dart';

class TokenStorageRepository implements ITokenStorageRepository {
  final SharedPreferences _prefs;
  static const cookieKey = 'cookie';

  TokenStorageRepository(this._prefs);

  @override
  Future<String?> getToken() async => _prefs.getString(cookieKey);

  @override
  Future<bool> setToken(String cookie) async => _prefs.setString(
        cookieKey,
        cookie,
      );

  @override
  Future<void> deleteToken() async => _prefs.remove(cookieKey);

  @override
  void dispose() {}
}
