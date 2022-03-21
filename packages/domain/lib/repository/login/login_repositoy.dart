import 'package:domain/entities/login/login_response.dart';
import 'package:domain/core.domain/core.usecase/base_repository.dart';

abstract class LoginRepository implements BaseRepository {
  @override
  void dispose() {}
  Future<LoginResponse> getLogin();
  Future<LoginResponse> sendLogin(Map<String, dynamic> request);
}
