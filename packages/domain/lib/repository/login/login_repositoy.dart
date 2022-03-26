abstract class LoginRepository {
  Stream<String> get email;
  Stream<String> get password;
  Stream<bool> get submitValid;
  Function(String) get setEmail;
  Function(String) get setPassword;
  void dispose();
}
