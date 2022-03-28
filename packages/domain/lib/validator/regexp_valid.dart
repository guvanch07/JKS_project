import 'package:domain/core/exception/exceptions.dart';
import 'package:domain/validator/base_validator.dart';

class RegExpImpl implements BaseValidator {
  final String _regExpRule;

  RegExpImpl(this._regExpRule);

  @override
  bool isValid(Object? field) {
    if (field is String) {
      return RegExp(_regExpRule).hasMatch(field);
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
