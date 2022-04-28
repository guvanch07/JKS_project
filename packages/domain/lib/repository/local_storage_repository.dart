import 'package:domain/repository/base_repository.dart';

abstract class ILocalStorageRepository implements BaseRepository{
  Future<bool> setToken(String token);

  Future<String?> getToken();

  Future<void> deleteToken();
}