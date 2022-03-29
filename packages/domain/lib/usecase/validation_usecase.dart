import 'package:domain/model/api_exception.dart';
import 'package:domain/model/login_step_field.dart';
import 'package:domain/usecase/base_usecase.dart';
import 'package:domain/validator/login_step_validation_schema.dart';

class LoginValidationUseCase
    implements UseCaseParams<LoginParms, Future<bool>> {
  final LoginValidation _validation;

  LoginValidationUseCase(this._validation);

  @override
  Future<bool> call(LoginParms params) {
    final authException = AuthException(null, null);

    _validation.loginValidators.forEach((element) {
      if (!element.isValid(params.login)) {
        authException.loginError = element.runtimeType.toString();
        return;
      }
    });

    _validation.passwordValidators.forEach((element) {
      if (!element.isValid(params.password)) {
        authException.passwordError = element.runtimeType.toString();
        return;
      }
    });

    if (authException.loginError != null &&
        authException.passwordError == null) {
      return Future.error(authException);
    } else {
      return Future.value(true);
    }
  }

  @override
  void dispose() {}
}
