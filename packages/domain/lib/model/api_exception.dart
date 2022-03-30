class AuthException {
  String? loginError;
  String? passwordError;

  AuthException(this.loginError, this.passwordError);
  AuthException copy() => AuthException(loginError, passwordError);
}
