import 'package:flutter/material.dart';
import 'package:presentation/core/helpers/primary_button.dart';
import 'package:presentation/screen/login/bloc/login_validate/validation.dart';
import 'package:presentation/widgets/text_field.dart';

part 'login_widgets.dart';

Map<String, String> _formfield = <String, String>{};

class LoginPageWithKey extends StatelessWidget {
  const LoginPageWithKey({
    Key? key,
    required this.keyLogin,
    required this.keyPassword,
    this.onChangedEmail,
    this.onChangedPassword,
    this.initialLogin,
    this.initialPassword,
    required this.onPressLogin,
    required this.emailException,
    required this.passwordException,
  }) : super(key: key);

  final GlobalKey<FormFieldState<dynamic>> keyLogin;
  final GlobalKey<FormFieldState<dynamic>> keyPassword;
  final dynamic Function(String)? onChangedEmail;
  final dynamic Function(String)? onChangedPassword;
  final String? initialLogin;
  final String? initialPassword;
  final VoidCallback onPressLogin;
  final String? emailException;
  final String? passwordException;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Column(
        children: [
          const SizedBox(height: 20),
          _LoginEmailWithKey(
            textField: _formfield,
            formkey: keyLogin,
            onChangedEmail: onChangedEmail,
            initialLogin: initialLogin,
            exceptionEmail: emailException ?? "",
          ),
          const SizedBox(height: 20),
          _LoginPasswordWithKey(
            textField: _formfield,
            formkey: keyPassword,
            onChangedPassword: onChangedPassword,
            initialPassword: initialPassword,
            exceptionPassword: passwordException ?? "",
          ),
          const Spacer(),
          _LoginButtonWithKey(
            textField: _formfield,
            callBack: onPressLogin,
          )
        ],
      ),
    ));
  }
}
