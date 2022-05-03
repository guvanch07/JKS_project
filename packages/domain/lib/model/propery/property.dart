class Property {
  Property({
    required this.propertyClass,
    required this.parameterDefinitions,
  });

  final String propertyClass;
  final List<ParameterDefinition>? parameterDefinitions;

  factory Property.fromJson(Map<String, dynamic> json) => Property(
        propertyClass: json["_class"],
        parameterDefinitions: json["parameterDefinitions"] == null
            ? null
            : List<ParameterDefinition>.from(json["parameterDefinitions"]
                .map((x) => ParameterDefinition.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "_class": propertyClass,
        "parameterDefinitions": parameterDefinitions == null
            ? null
            : List<dynamic>.from(parameterDefinitions!.map((x) => x.toJson())),
      };
}

class ParameterDefinition {
  ParameterDefinition({
    required this.parameterDefinitionClass,
    required this.defaultParameterValue,
    required this.description,
    required this.name,
    required this.type,
    required this.choices,
  });

  final String parameterDefinitionClass;
  final DefaultParameterValue defaultParameterValue;
  final String description;
  final String name;
  final String type;
  final List<String>? choices;

  factory ParameterDefinition.fromJson(Map<String, dynamic> json) =>
      ParameterDefinition(
        parameterDefinitionClass: json["_class"],
        defaultParameterValue:
            DefaultParameterValue.fromJson(json["defaultParameterValue"]),
        description: json["description"],
        name: json["name"],
        type: json["type"],
        choices: json["choices"] == null
            ? null
            : List<String>.from(json["choices"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "_class": parameterDefinitionClass,
        "defaultParameterValue": defaultParameterValue.toJson(),
        "description": description,
        "name": name,
        "type": type,
        "choices":
            choices == null ? null : List<dynamic>.from(choices!.map((x) => x)),
      };
}

class DefaultParameterValue {
  DefaultParameterValue({
    required this.defaultParameterValueClass,
    required this.name,
    required this.value,
  });

  final String defaultParameterValueClass;
  final String name;
  final String value;

  factory DefaultParameterValue.fromJson(Map<String, dynamic> json) =>
      DefaultParameterValue(
        defaultParameterValueClass: json["_class"],
        name: json["name"],
        value: json["value"],
      );

  Map<String, dynamic> toJson() => {
        "_class": defaultParameterValueClass,
        "name": name,
        "value": value,
      };
}
