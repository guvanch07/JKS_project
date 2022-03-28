class AuthException {
  String? loginError;
  String? passwordError;

  AuthException(this.loginError, this.passwordError);
}
