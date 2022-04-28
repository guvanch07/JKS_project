import 'package:domain/validator/validator.dart';

class MinLengthValidator implements Validator {
  final int _minLength;

  MinLengthValidator(this._minLength);

  @override
  bool isValid(Object? field) {
    if (field is String) {
      return field.length >= _minLength;
    } else if (field == null) {
      return false;
    } else {
      throw Exception(
        "Class $runtimeType, method isValid. ${field.runtimeType} is not String",
      );
    }
  }
}
