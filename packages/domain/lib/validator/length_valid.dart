import 'package:domain/core/exception/exceptions.dart';
import 'package:domain/validator/base_validator.dart';

class LengthImpl implements BaseValidator {
  final int _minLength;

  LengthImpl(this._minLength);

  @override
  bool isValid(Object? field) {
    if (field is String) {
      return field.length >= _minLength;
    } else if (field == null) {
      return false;
    } else {
      throw RunTimeException(
        message:
            "Class $runtimeType, method isValid. ${field.runtimeType} is not String",
      );
    }
  }
}
