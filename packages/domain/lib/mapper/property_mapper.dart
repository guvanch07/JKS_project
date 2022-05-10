import 'package:domain/model/propery/property.dart';

abstract class PropertyApiMapper {
  factory PropertyApiMapper() => _PropertyApiMapper();
  List listConverterToMap(List<dynamic> listToMap);
}

class _PropertyApiMapper implements PropertyApiMapper {
  @override
  List listConverterToMap(List listToMap) {
    final propertyToMap = listToMap.map(
      (parameter) {
        String? description;
        String? name;
        String? type;
        String? defaultValue;
        List<String>? choices;

        if (parameter.containsKey('defaultParameterValue') &&
            parameter['defaultParameterValue'].containsKey('value')) {
          defaultValue = parameter['defaultParameterValue']['value'].toString();
        }
        if (parameter.containsKey('description')) {
          description = parameter['description'];
        }
        if (parameter.containsKey('name')) {
          name = parameter['name'];
        }
        if (parameter.containsKey('type')) {
          type = parameter['type'];
        }
        if (parameter.containsKey('choices')) {
          choices = List<String>.from(parameter['choices']);
        }

        return Property(
          choices: choices,
          description: description,
          name: name,
          defaultValue: defaultValue,
          type: type,
        );
      },
    ).toList();

    return propertyToMap;
  }
}
