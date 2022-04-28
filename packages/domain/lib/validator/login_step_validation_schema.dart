import 'package:domain/validator/min_length_validator.dart';
import 'package:domain/validator/required_field_validator.dart';
import 'package:domain/validator/validator.dart';

class LoginStepValidationSchema {
  final List<Validator> loginValidators = [
    RequiredFieldValidator(),
    MinLengthValidator(6),
  ];

  final List<Validator> passwordValidators = [
    RequiredFieldValidator(),
    //RegExpValidator('^(?=.*[A-Z])(?=.*[a-z])(?=.*[0-9])(?=.*_)[a-zA-Z0-9_]+\$'),
  ];
}
