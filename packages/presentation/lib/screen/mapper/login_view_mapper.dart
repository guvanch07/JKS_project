import 'package:presentation/screen/login/bloc/login_data.dart';
import 'package:domain/model/login_step_field.dart';

abstract class LoginViewMapper {
  factory LoginViewMapper() => _LoginViewMapper();

  LoginParms mapScreenDataToRequest(LoginData screenData);
}

class _LoginViewMapper implements LoginViewMapper {
  @override
  LoginParms mapScreenDataToRequest(
    LoginData screenData,
  ) =>
      LoginParms(
        screenData.loginInput,
        screenData.passwordInput,
      );
}
