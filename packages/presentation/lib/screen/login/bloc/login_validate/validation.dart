import 'package:data/core/error_const.dart';

String validatePassword(String formPassword, String exceptionPassword) {
  if (formPassword.isEmpty) return "password is requried.";
  String pattern =
      r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$';
  RegExp reg = RegExp(pattern);
  if (!reg.hasMatch(formPassword)) {
    return ErrorTextField.password_invalid;
  }
  return exceptionPassword;
}

String validateEmail(String formEmail, String exceptionEmail) {
  if (formEmail.isEmpty) return "E-mail is requried.";
  String pattern = r'\w+@\W+\.\w+';
  RegExp reg = RegExp(pattern);
  if (!reg.hasMatch(formEmail)) {
    return ErrorTextField.login_invalid;
  }

  return exceptionEmail;
}
