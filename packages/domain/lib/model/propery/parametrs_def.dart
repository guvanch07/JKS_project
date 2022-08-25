import 'package:domain/mapper/base_mapper.dart';
import 'package:get_it/get_it.dart';

class ParameterDefinitionsFields {
  static const String screenId = '_screenId';
  static const String id = '_id';
  static const String type = 'type';
  static const String defaultValue = 'defaultValue';
  static const String description = 'description';
  static const String choices = 'choices';
  static const String name = 'name';
  static const List<String> fields = [
    screenId,
    id,
    type,
    defaultValue,
    description,
    choices,
    name,
  ];
}

class ParameterDefinitions {
  int? screenId;
  int? id;
  final String? type;
  final String? defaultValue;
  final String? description;
  final List? choices;
  final String? name;

  ParameterDefinitions({
    this.screenId,
    this.id,
    required this.type,
    required this.defaultValue,
    required this.description,
    required this.choices,
    required this.name,
  });

  factory ParameterDefinitions.fromJson(dynamic json) {
    return ParameterDefinitions(
      type: json['type'],
      defaultValue: json['defaultParameterValue']['value'] ?? '',
      description: json['description'] ?? '',
      choices: json['choices'] ?? [''],
      name: json['name'] ?? '',
    );
  }

  factory ParameterDefinitions.fromSqfJson(Map<String, Object?> json) {
    final StringToListMapper _stringToListMapper =
        GetIt.I.get<StringToListMapper>();

    return ParameterDefinitions(
      screenId: json[ParameterDefinitionsFields.screenId] as int?,
      id: json[ParameterDefinitionsFields.id] as int?,
      type: json[ParameterDefinitionsFields.type] as String?,
      defaultValue: json[ParameterDefinitionsFields.defaultValue] as String?,
      description: json[ParameterDefinitionsFields.description] as String?,
      choices: _stringToListMapper(
          json[ParameterDefinitionsFields.choices] as String),
      name: json[ParameterDefinitionsFields.name] as String?,
    );
  }

  Map<String, Object?> toSqfJson() {
    final ListToStringMapper _listToStringMapper =
        GetIt.I.get<ListToStringMapper>();

    return {
      ParameterDefinitionsFields.screenId: screenId,
      ParameterDefinitionsFields.id: id,
      ParameterDefinitionsFields.type: type ?? '',
      ParameterDefinitionsFields.defaultValue: defaultValue ?? '',
      ParameterDefinitionsFields.description: description ?? '',
      ParameterDefinitionsFields.choices: _listToStringMapper(choices ?? ['']),
      ParameterDefinitionsFields.name: description ?? '',
    };
  }

  ParameterDefinitions copy({
    int? screenId,
    int? id,
    String? type,
    String? defaultValue,
    String? description,
    List? choices,
    String? name,
  }) =>
      ParameterDefinitions(
        screenId: screenId ?? this.screenId,
        id: id ?? this.id,
        type: type ?? this.type,
        defaultValue: defaultValue ?? this.defaultValue,
        description: description ?? this.description,
        choices: choices ?? this.choices,
        name: name ?? this.name,
      );
}
