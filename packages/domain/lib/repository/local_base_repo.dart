import 'package:domain/repository/base_repository.dart';

abstract class ILocalStorageRepo extends BaseRepository {
  Future<bool> setToken(String token);
  Future<String?> getToken();
  Future<void> deleteToken();
}
