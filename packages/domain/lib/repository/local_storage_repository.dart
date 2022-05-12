import 'package:domain/repository/base_repository.dart';

abstract class ILocalStorageRepository implements BaseRepository {
  Future<String?> getPassword();
  Future<String?> getLogin();
  Future<String?> getToken();
  Future<String?> getCookie();
  Future<String?> getCrumbRequestField();
  Future<void> deleteToken();
  Future<void> deleteCookie();
  Future<void> deleteCrumb();
  Future<void> deleteLogin();
  Future<void> deletePassword();
  Future<bool> setToken(String token);
  Future<bool> setCookie(String token);
  Future<void> setLogin(String login);
  Future<void> setPassword(String password);
  Future<void> setCrumbRequestField(String crumbRequestField);
}
