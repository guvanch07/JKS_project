import 'package:domain/model/propery/property.dart';
import 'package:collection/collection.dart';

abstract class Mapper<Input, Output> {
  Output call(Input data);
}

class PropertyApiMapper extends Mapper {
  @override
  List<Property>? call(dynamic data) {
    if (data == null || data.isEmpty) {
      return null;
    }

    final List property = data['property'];
    final Map parameterDefinitions = property.firstWhereOrNull(
      (element) => element.containsKey('parameterDefinitions'),
    );

    final List listParameterDefinitions =
        parameterDefinitions['parameterDefinitions'];

    final propertyToMap = listParameterDefinitions.map(
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
