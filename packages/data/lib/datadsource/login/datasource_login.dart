import 'dart:async';

abstract class Validation {
  StreamTransformer validateEmail();
  StreamTransformer validatePasssword();
}

class ValidationImpl implements Validation {
  @override
  StreamTransformer<String, String> validateEmail() {
    final _validateEmail = StreamTransformer<String, String>.fromHandlers(
        handleData: (email, sink) {
      if (email.contains('@')) {
        sink.add(email);
      } else if (email.length == 0) {
        sink.addError('The e-mail is invalid!');
      } else {
        sink.addError('Enter the e-mail');
      }
    });
    return _validateEmail;
  }

  @override
  StreamTransformer<String, String> validatePasssword() {
    final validateOnlyNumbers = StreamTransformer<String, String>.fromHandlers(
        handleData: (password, sink) {
      String pattern = r'(^[0-9]*$)';
      RegExp regExp = RegExp(pattern);
      if (password.length > 6) {
        sink.add(password);
      } else if (!regExp.hasMatch(password)) {
        sink.addError('dont use symbols');
      } else {
        sink.addError('password must be at least 6 charecters');
      }
    });
    return validateOnlyNumbers;
  }
}
