import 'package:domain/repository/base_repository.dart';

abstract class ICookieRepository implements BaseRepository {
  Future<bool> setCookie(String token);
  Future<String?> getCookie();
  Future<void> deleteCookie();
}
