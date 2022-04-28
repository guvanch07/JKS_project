import 'package:domain/validator/validator.dart';

class RegExpValidator implements Validator {
  final String _regExpRule;

  RegExpValidator(this._regExpRule);

  @override
  bool isValid(Object? field) {
    if (field is String) {
      return RegExp(_regExpRule).hasMatch(field);
    } else if (field == null) {
      return false;
    } else {
      throw Exception(
        "Class $runtimeType, method isValid. ${field.runtimeType} is not String",
      );
    }
  }
}
