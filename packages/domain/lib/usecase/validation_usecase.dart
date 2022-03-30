import 'package:domain/model/api_exception.dart';
import 'package:domain/model/login_step_field.dart';
import 'package:domain/usecase/base_usecase.dart';
import 'package:domain/validator/login_step_validation_schema.dart';
import 'package:collection/collection.dart';

class LoginValidationUseCase
    implements UseCaseParams<LoginParms, Future<bool>> {
  final LoginValidation _validation;

  LoginValidationUseCase(this._validation);

  @override
  Future<bool> call(LoginParms params) {
    final authException = AuthException(null, null);

    final failedLoginValidator = _validation.loginValidators.firstWhereOrNull(
      (validator) => !validator.isValid(params.login),
    );

    final failedPasswordValidator =
        _validation.passwordValidators.firstWhereOrNull(
      (validator) => !validator.isValid(params.password),
    );

    if (failedLoginValidator != null) {
      authException.loginError =
          "login.${failedLoginValidator.runtimeType.toString()}";
    }

    if (failedPasswordValidator != null) {
      authException.passwordError =
          "password.${failedPasswordValidator.runtimeType.toString()}";
    }

    if (failedLoginValidator == null && failedPasswordValidator == null) {
      return Future.value(true);
    } else {
      return Future.error(authException);
    }
  }

  @override
  void dispose() {}
}
