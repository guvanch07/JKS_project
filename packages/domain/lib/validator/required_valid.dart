import 'package:domain/core/exception/exceptions.dart';
import 'package:domain/validator/base_validator.dart';

class RequiredFieldImpl implements BaseValidator {
  @override
  bool isValid(Object? field) {
    if (field is String) {
      return field.isNotEmpty;
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
