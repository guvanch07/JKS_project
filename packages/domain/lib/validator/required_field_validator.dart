import 'package:domain/validator/validator.dart';

class RequiredFieldValidator implements Validator {
  @override
  bool isValid(Object? field) {
    if (field is String) {
      return field.isNotEmpty;
    } else if (field == null) {
      return false;
    } else {
      throw Exception(
        "Class $runtimeType, method isValid. ${field.runtimeType} is not String",
      );
    }
  }
}
