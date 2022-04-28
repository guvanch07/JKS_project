import 'package:domain/repository/base_repository.dart';
import 'package:domain/repository/local_storage_repository.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LocalStorageRepository
    implements ILocalStorageRepository, BaseRepository {
  final SharedPreferences _prefs;
  static const tokenKey = 'token';

  LocalStorageRepository(this._prefs);

  @override
  Future<String?> getToken() async => _prefs.getString(tokenKey);

  @override
  Future<bool> setToken(String token) async => _prefs.setString(
        tokenKey,
        token,
      );

  @override
  Future<void> deleteToken() async => _prefs.remove(tokenKey);

  @override
  void dispose() {}
}
