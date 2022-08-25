import 'package:domain/mapper/build_data_mapper.dart';
import 'package:domain/model/propery/parametrs_def.dart';
import 'package:get_it/get_it.dart';

class ApiBuildDataFields {
  static const String screenId = '_screenId';
  static const String description = 'description';
  static const String displayName = 'displayName';
  static final List<String> fields = [
    screenId,
    description,
    displayName,
  ];
}

class ApiBuildDataModel {
  final int? screenId;
  final String description;
  final String displayName;
  final List<ParameterDefinitions> buildData;

  ApiBuildDataModel({
    this.screenId,
    required this.description,
    required this.displayName,
    required this.buildData,
  });

  factory ApiBuildDataModel.fromJson(dynamic json) {
    final ParameterDefinitionsMapper _parameterDefinitionsMapper =
        GetIt.I.get<ParameterDefinitionsMapper>();

    return ApiBuildDataModel(
      description: json['description'] ?? '',
      displayName: json['displayName'] ?? '',
      buildData: _parameterDefinitionsMapper(json['property']),
    );
  }

  factory ApiBuildDataModel.fromSqfJson(Map<String, Object?> json) {
    return ApiBuildDataModel(
      screenId: json[ApiBuildDataFields.screenId] as int?,
      description: json[ApiBuildDataFields.description] as String,
      displayName: json[ApiBuildDataFields.displayName] as String,
      buildData: [],
    );
  }

  Map<String, Object?> toSqfJson() => {
        ApiBuildDataFields.screenId: screenId,
        ApiBuildDataFields.description: description,
        ApiBuildDataFields.displayName: displayName,
      };

  ApiBuildDataModel copy({
    int? screenId,
    String? description,
    String? displayName,
    List<ParameterDefinitions>? buildData,
  }) =>
      ApiBuildDataModel(
        screenId: screenId ?? this.screenId,
        description: description ?? this.description,
        displayName: displayName ?? this.displayName,
        buildData: buildData ?? this.buildData,
      );
}
