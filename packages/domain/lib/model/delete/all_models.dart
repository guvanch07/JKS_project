// import 'dart:convert';

// Welcome welcomeFromJson(String str) => Welcome.fromJson(json.decode(str));

// String welcomeToJson(Welcome data) => json.encode(data.toJson());

// class Welcome {
//   Welcome({
//     required this.welcomeClass,
//     required this.actions,
//     required this.description,
//     required this.displayName,
//     this.displayNameOrNull,
//     required this.fullDisplayName,
//     required this.fullName,
//     required this.name,
//     required this.url,
//     required this.buildable,
//     required this.builds,
//     required this.color,
//     required this.firstBuild,
//     required this.healthReport,
//     required this.inQueue,
//     required this.keepDependencies,
//     required this.lastBuild,
//     required this.lastCompletedBuild,
//     required this.lastFailedBuild,
//     required this.lastStableBuild,
//     required this.lastSuccessfulBuild,
//     this.lastUnstableBuild,
//     required this.lastUnsuccessfulBuild,
//     required this.nextBuildNumber,
//     required this.property,
//     this.queueItem,
//     required this.concurrentBuild,
//     required this.resumeBlocked,
//   });

//   String welcomeClass;
//   List<Action> actions;
//   String description;
//   String displayName;
//   dynamic displayNameOrNull;
//   String fullDisplayName;
//   String fullName;
//   String name;
//   String url;
//   bool buildable;
//   List<Build> builds;
//   String color;
//   Build firstBuild;
//   List<HealthReport> healthReport;
//   bool inQueue;
//   bool keepDependencies;
//   Build lastBuild;
//   Build lastCompletedBuild;
//   Build lastFailedBuild;
//   Build lastStableBuild;
//   Build lastSuccessfulBuild;
//   dynamic lastUnstableBuild;
//   Build lastUnsuccessfulBuild;
//   int nextBuildNumber;
//   List<Property> property;
//   dynamic queueItem;
//   bool concurrentBuild;
//   bool resumeBlocked;

//   factory Welcome.fromJson(Map<String, dynamic> json) => Welcome(
//         welcomeClass: json["_class"],
//         actions:
//             List<Action>.from(json["actions"].map((x) => Action.fromJson(x))),
//         description: json["description"],
//         displayName: json["displayName"],
//         displayNameOrNull: json["displayNameOrNull"],
//         fullDisplayName: json["fullDisplayName"],
//         fullName: json["fullName"],
//         name: json["name"],
//         url: json["url"],
//         buildable: json["buildable"],
//         builds: List<Build>.from(json["builds"].map((x) => Build.fromJson(x))),
//         color: json["color"],
//         firstBuild: Build.fromJson(json["firstBuild"]),
//         healthReport: List<HealthReport>.from(
//             json["healthReport"].map((x) => HealthReport.fromJson(x))),
//         inQueue: json["inQueue"],
//         keepDependencies: json["keepDependencies"],
//         lastBuild: Build.fromJson(json["lastBuild"]),
//         lastCompletedBuild: Build.fromJson(json["lastCompletedBuild"]),
//         lastFailedBuild: Build.fromJson(json["lastFailedBuild"]),
//         lastStableBuild: Build.fromJson(json["lastStableBuild"]),
//         lastSuccessfulBuild: Build.fromJson(json["lastSuccessfulBuild"]),
//         lastUnstableBuild: json["lastUnstableBuild"],
//         lastUnsuccessfulBuild: Build.fromJson(json["lastUnsuccessfulBuild"]),
//         nextBuildNumber: json["nextBuildNumber"],
//         property: List<Property>.from(
//             json["property"].map((x) => Property.fromJson(x))),
//         queueItem: json["queueItem"],
//         concurrentBuild: json["concurrentBuild"],
//         resumeBlocked: json["resumeBlocked"],
//       );

//   Map<String, dynamic> toJson() => {
//         "_class": welcomeClass,
//         "actions": List<dynamic>.from(actions.map((x) => x.toJson())),
//         "description": description,
//         "displayName": displayName,
//         "displayNameOrNull": displayNameOrNull,
//         "fullDisplayName": fullDisplayName,
//         "fullName": fullName,
//         "name": name,
//         "url": url,
//         "buildable": buildable,
//         "builds": List<dynamic>.from(builds.map((x) => x.toJson())),
//         "color": color,
//         "firstBuild": firstBuild.toJson(),
//         "healthReport": List<dynamic>.from(healthReport.map((x) => x.toJson())),
//         "inQueue": inQueue,
//         "keepDependencies": keepDependencies,
//         "lastBuild": lastBuild.toJson(),
//         "lastCompletedBuild": lastCompletedBuild.toJson(),
//         "lastFailedBuild": lastFailedBuild.toJson(),
//         "lastStableBuild": lastStableBuild.toJson(),
//         "lastSuccessfulBuild": lastSuccessfulBuild.toJson(),
//         "lastUnstableBuild": lastUnstableBuild,
//         "lastUnsuccessfulBuild": lastUnsuccessfulBuild.toJson(),
//         "nextBuildNumber": nextBuildNumber,
//         "property": List<dynamic>.from(property.map((x) => x.toJson())),
//         "queueItem": queueItem,
//         "concurrentBuild": concurrentBuild,
//         "resumeBlocked": resumeBlocked,
//       };
// }

// class Action {
//   Action({
//     required this.actionClass,
//   });

//   String actionClass;

//   factory Action.fromJson(Map<String, dynamic> json) => Action(
//         actionClass: json["_class"],
//       );

//   Map<String, dynamic> toJson() => {
//         "_class": actionClass,
//       };
// }

// class Build {
//   Build({
//     required this.buildClass,
//     required this.number,
//     required this.url,
//   });

//   Class? buildClass;
//   int number;
//   String url;

//   factory Build.fromJson(Map<String, dynamic> json) => Build(
//         buildClass: classValues.map[json["_class"]],
//         number: json["number"],
//         url: json["url"],
//       );

//   Map<String, dynamic> toJson() => {
//         "_class": classValues.reverse![buildClass],
//         "number": number,
//         "url": url,
//       };
// }

// enum Class {
//   ORG_JENKINSCI_PLUGINS_WORKFLOW_JOB_WORKFLOW_RUN,
//   ORG_JENKINSCI_WORKFLOW_JOB_WORKFLOW_RUN
// }

// Map<String, dynamic> map = {};
// Map<dynamic, String> reverseMap = {};

// final classValues = EnumValues(map, reverseMap);

// class HealthReport {
//   HealthReport({
//     required this.description,
//     required this.iconClassName,
//     required this.iconUrl,
//     required this.score,
//   });

//   String description;
//   String iconClassName;
//   String iconUrl;
//   int score;

//   factory HealthReport.fromJson(Map<String, dynamic> json) => HealthReport(
//         description: json["description"],
//         iconClassName: json["iconClassName"],
//         iconUrl: json["iconUrl"],
//         score: json["score"],
//       );

//   Map<String, dynamic> toJson() => {
//         "description": description,
//         "iconClassName": iconClassName,
//         "iconUrl": iconUrl,
//         "score": score,
//       };
// }

// class Property {
//   Property({
//     required this.propertyClass,
//     required this.parameterDefinitions,
//   });

//   String propertyClass;
//   List<ParameterDefinition>? parameterDefinitions;

//   factory Property.fromJson(Map<String, dynamic> json) => Property(
//         propertyClass: json["_class"],
//         parameterDefinitions: json["parameterDefinitions"] == null
//             ? null
//             : List<ParameterDefinition>.from(json["parameterDefinitions"]
//                 .map((x) => ParameterDefinition.fromJson(x))),
//       );

//   Map<String, dynamic> toJson() => {
//         "_class": propertyClass,
//         "parameterDefinitions": parameterDefinitions == null
//             ? null
//             : List<dynamic>.from(parameterDefinitions!.map((x) => x.toJson())),
//       };
// }

// class ParameterDefinition {
//   ParameterDefinition({
//     required this.parameterDefinitionClass,
//     required this.defaultParameterValue,
//     required this.description,
//     required this.name,
//     required this.type,
//     required this.choices,
//   });

//   String parameterDefinitionClass;
//   DefaultParameterValue defaultParameterValue;
//   String description;
//   String name;
//   String type;
//   List<String>? choices;

//   factory ParameterDefinition.fromJson(Map<String, dynamic> json) =>
//       ParameterDefinition(
//         parameterDefinitionClass: json["_class"],
//         defaultParameterValue:
//             DefaultParameterValue.fromJson(json["defaultParameterValue"]),
//         description: json["description"],
//         name: json["name"],
//         type: json["type"],
//         choices: json["choices"] == null
//             ? null
//             : List<String>.from(json["choices"].map((x) => x)),
//       );

//   Map<String, dynamic> toJson() => {
//         "_class": parameterDefinitionClass,
//         "defaultParameterValue": defaultParameterValue.toJson(),
//         "description": description,
//         "name": name,
//         "type": type,
//         "choices":
//             choices == null ? null : List<dynamic>.from(choices!.map((x) => x)),
//       };
// }

// class DefaultParameterValue {
//   DefaultParameterValue({
//     required this.defaultParameterValueClass,
//     required this.name,
//     required this.value,
//   });

//   String defaultParameterValueClass;
//   String name;
//   String value;

//   factory DefaultParameterValue.fromJson(Map<String, dynamic> json) =>
//       DefaultParameterValue(
//         defaultParameterValueClass: json["_class"],
//         name: json["name"],
//         value: json["value"],
//       );

//   Map<String, dynamic> toJson() => {
//         "_class": defaultParameterValueClass,
//         "name": name,
//         "value": value,
//       };
// }

// class EnumValues<T> {
//   Map<String, T> map;
//   Map<T, String> reverseMap;

//   EnumValues(this.map, this.reverseMap);

//   Map<T, String>? get reverse {
//     reverseMap ??= map.map((k, v) => MapEntry(v, k));
//     return null;
//   }
// }
