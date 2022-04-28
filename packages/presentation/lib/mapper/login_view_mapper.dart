import 'package:domain/model/params/login_step_fields.dart';
import 'package:presentation/screen/login/bloc/login_data.dart';

abstract class LoginViewMapper {
  factory LoginViewMapper() => _LoginViewMapper();

  LoginParams mapScreenDataToRequest(LoginData screenData);
}

class _LoginViewMapper implements LoginViewMapper {
  @override
  LoginParams mapScreenDataToRequest(
    LoginData screenData,
  ) =>
      LoginParams(
        screenData.loginInput,
        screenData.passwordInput,
      );
}
