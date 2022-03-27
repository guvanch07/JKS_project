class AuthException {
  final String? loginError;
  final String? passwordError;
  AuthException(
    this.loginError,
    this.passwordError,
  );

  AuthException copy() => AuthException(loginError, passwordError);
}
