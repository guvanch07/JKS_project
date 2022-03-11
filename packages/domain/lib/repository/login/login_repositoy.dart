import 'package:domain/entities/login_response.dart';
import 'package:domain/repository/base_repository.dart';

abstract class LoginRepository implements BaseRepository {
  @override
  void dispose() {}
  Future<LoginResponse> getLogin();
  Future<LoginResponse> sendLogin(Map<String, dynamic> request);
}
