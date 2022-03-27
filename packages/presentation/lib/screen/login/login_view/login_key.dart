import 'package:flutter/material.dart';
import 'package:presentation/core/helpers/primary_button.dart';
import 'package:presentation/widgets/text_field.dart';

const String _login = "Login";
const String _password = "Password";

class LoginPageWithKey extends StatelessWidget {
  const LoginPageWithKey({
    Key? key,
    this.onChangedEmail,
    this.onChangedPassword,
    required this.onPressLogin,
    required this.textField,
    required this.keyStore,
    this.validateEmail,
    this.validatePassword,
  }) : super(key: key);

  final dynamic Function(String)? onChangedEmail;
  final dynamic Function(String)? onChangedPassword;
  final VoidCallback onPressLogin;
  final Map<String, String> textField;
  final GlobalKey<FormState> keyStore;
  final String? Function(String?)? validateEmail;
  final String? Function(String?)? validatePassword;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Form(
        key: keyStore,
        child: Column(
          children: [
            const SizedBox(height: 20),
            LoginTextField(
              onSaved: (value) => textField[_login] = value ?? "",
              obscure: false,
              validator: validateEmail,
              //onChanged: (String value) {},
              text: _login,
            ),
            const SizedBox(height: 20),
            LoginTextField(
              obscure: true,
              validator: validatePassword,
              onSaved: (value) => textField[_password] = value ?? "",
              //onChanged: (String value) {},
              text: _password,
            ),
            const Spacer(),
            PrimaryButton(onTap: onPressLogin, text: "Login")
          ],
        ),
      ),
    ));
  }
}
