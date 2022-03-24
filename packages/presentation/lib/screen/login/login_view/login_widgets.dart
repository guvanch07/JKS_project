part of 'login_key.dart';

class _LoginButtonWithKey extends StatelessWidget {
  const _LoginButtonWithKey({
    Key? key,
    required this.textField,
    required this.callBack,
  }) : super(key: key);

  final Map<String, String> textField;
  final VoidCallback callBack;

  @override
  Widget build(BuildContext context) {
    return PrimaryButton(onTap: callBack, text: "Login");
  }
}

String _login = 'Login';
String _password = 'Password';

class _LoginPasswordWithKey extends StatelessWidget {
  const _LoginPasswordWithKey({
    Key? key,
    required this.textField,
    required this.formkey,
    this.onChangedPassword,
    this.initialPassword,
    required this.exceptionPassword,
  }) : super(key: key);

  final Map<String, String> textField;
  final GlobalKey<FormFieldState<dynamic>> formkey;
  final dynamic Function(String)? onChangedPassword;
  final String? initialPassword;
  final String exceptionPassword;

  @override
  Widget build(BuildContext context) {
    return LoginTextField(
      iniialValue: initialPassword,
      obscure: true,
      onChanged: onChangedPassword,
      text: _login,
      validator: (value) => validatePassword(value ?? "", exceptionPassword),
      onSaved: (val) => textField[_login] = val ?? "",
      keyState: formkey,
    );
  }
}

class _LoginEmailWithKey extends StatelessWidget {
  const _LoginEmailWithKey({
    Key? key,
    required this.textField,
    required this.formkey,
    this.onChangedEmail,
    this.initialLogin,
    required this.exceptionEmail,
  }) : super(key: key);

  final Map<String, String> textField;
  final GlobalKey<FormFieldState<dynamic>> formkey;
  final dynamic Function(String)? onChangedEmail;
  final String? initialLogin;
  final String exceptionEmail;

  @override
  Widget build(BuildContext context) {
    return LoginTextField(
      iniialValue: initialLogin,
      obscure: false,
      onChanged: onChangedEmail,
      text: _password,
      validator: (value) => validateEmail(value ?? "", exceptionEmail),
      onSaved: (val) => textField[_password] = val ?? "",
      keyState: formkey,
    );
  }
}
