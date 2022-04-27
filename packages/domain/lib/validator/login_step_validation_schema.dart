import 'package:domain/validator/base_validator.dart';
import 'package:domain/validator/regexp_valid.dart';

import 'length_valid.dart';
import 'required_valid.dart';

class LoginValidation {
  final List<BaseValidator> loginValidators = [
    RequiredFieldImpl(),
    LengthImpl(6),
  ];

  final List<BaseValidator> passwordValidators = [
    RequiredFieldImpl(),
    RegExpImpl(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$'),
  ];
}
