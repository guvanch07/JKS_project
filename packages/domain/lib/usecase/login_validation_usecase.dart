import 'package:domain/model/auth/authorization_exception.dart';
import 'package:domain/model/params/login_step_fields.dart';
import 'package:domain/usecase/base_usecase.dart';
import 'package:domain/validator/login_step_validation_schema.dart';
import 'package:collection/collection.dart';

class LoginValidationUseCase
    implements UseCaseParams<LoginParams, Future<bool>> {
  final LoginStepValidationSchema _validationSchema;

  LoginValidationUseCase(this._validationSchema);

  @override
  Future<bool> call(LoginParams params) {
    final authorizationException = AuthException(null, null);

    final failedLoginValidator =
        _validationSchema.loginValidators.firstWhereOrNull(
      (validator) => !validator.isValid(params.login),
    );

    final failedPasswordValidator =
        _validationSchema.passwordValidators.firstWhereOrNull(
      (validator) => !validator.isValid(params.password),
    );

    if (failedLoginValidator != null) {
      authorizationException.loginError =
          "login.${failedLoginValidator.runtimeType.toString()}";
    }

    if (failedPasswordValidator != null) {
      authorizationException.passwordError =
          "password.${failedPasswordValidator.runtimeType.toString()}";
    }

    if (failedLoginValidator == null && failedPasswordValidator == null) {
      return Future.value(true);
    } else {
      return Future.error(authorizationException);
    }
  }

  @override
  void dispose() {}
}
