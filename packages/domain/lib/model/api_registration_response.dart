import 'dart:convert';

import 'registration_response.dart';

class ApiRegistrationResponse implements RegistrationResponse {
  @override
  final Map<String, dynamic>? data;
  @override
  final String? step;

  ApiRegistrationResponse(this.data, this.step);

  static ApiRegistrationResponse? fromJson(dynamic data) {
    if (data == null || data.isEmpty) {
      return null;
    }

    var jsonData = data;
    if (data is String) {
      jsonData = json.decode(data);
    }

    return ApiRegistrationResponse(jsonData['data'], jsonData['step']);
  }
}

class CardModel {
  CardModel({
    required this.welcomeClass,
    required this.assignedLabels,
    required this.mode,
    required this.nodeDescription,
    required this.nodeName,
    required this.numExecutors,
    required this.description,
    required this.jobs,
    required this.overallLoad,
    required this.primaryView,
    required this.quietDownReason,
    required this.quietingDown,
    required this.slaveAgentPort,
    required this.unlabeledLoad,
    required this.url,
    required this.useCrumbs,
    required this.useSecurity,
    required this.views,
  });

  final String welcomeClass;
  final List<AssignedLabel> assignedLabels;
  final String mode;
  final String nodeDescription;
  final String nodeName;
  final int numExecutors;
  final dynamic description;
  final List<PrimaryView> jobs;
  final OverallLoad overallLoad;
  final PrimaryView primaryView;
  final dynamic quietDownReason;
  final bool quietingDown;
  final int slaveAgentPort;
  final UnlabeledLoad unlabeledLoad;
  final String url;
  final bool useCrumbs;
  final bool useSecurity;
  final List<PrimaryView> views;

  factory CardModel.fromJson(Map<String, dynamic> json) => CardModel(
        welcomeClass: json["_class"],
        assignedLabels: List<AssignedLabel>.from(
            json["assignedLabels"].map((x) => AssignedLabel.fromJson(x))),
        mode: json["mode"],
        nodeDescription: json["nodeDescription"],
        nodeName: json["nodeName"],
        numExecutors: json["numExecutors"],
        description: json["description"],
        jobs: List<PrimaryView>.from(
            json["jobs"].map((x) => PrimaryView.fromJson(x))),
        overallLoad: OverallLoad.fromJson(json["overallLoad"]),
        primaryView: PrimaryView.fromJson(json["primaryView"]),
        quietDownReason: json["quietDownReason"],
        quietingDown: json["quietingDown"],
        slaveAgentPort: json["slaveAgentPort"],
        unlabeledLoad: UnlabeledLoad.fromJson(json["unlabeledLoad"]),
        url: json["url"],
        useCrumbs: json["useCrumbs"],
        useSecurity: json["useSecurity"],
        views: List<PrimaryView>.from(
            json["views"].map((x) => PrimaryView.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "_class": welcomeClass,
        "assignedLabels":
            List<dynamic>.from(assignedLabels.map((x) => x.toJson())),
        "mode": mode,
        "nodeDescription": nodeDescription,
        "nodeName": nodeName,
        "numExecutors": numExecutors,
        "description": description,
        "jobs": List<dynamic>.from(jobs.map((x) => x.toJson())),
        "overallLoad": overallLoad.toJson(),
        "primaryView": primaryView.toJson(),
        "quietDownReason": quietDownReason,
        "quietingDown": quietingDown,
        "slaveAgentPort": slaveAgentPort,
        "unlabeledLoad": unlabeledLoad.toJson(),
        "url": url,
        "useCrumbs": useCrumbs,
        "useSecurity": useSecurity,
        "views": List<dynamic>.from(views.map((x) => x.toJson())),
      };
}

class AssignedLabel {
  AssignedLabel({
    required this.name,
  });

  String name;

  factory AssignedLabel.fromJson(Map<String, dynamic> json) => AssignedLabel(
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
      };
}

class PrimaryView {
  PrimaryView({
    required this.primaryViewClass,
    required this.name,
    required this.url,
    required this.color,
  });

  String primaryViewClass;
  String name;
  String url;
  String color;

  factory PrimaryView.fromJson(Map<String, dynamic> json) => PrimaryView(
        primaryViewClass: json["_class"],
        name: json["name"],
        url: json["url"],
        color: json["color"] == null ? null : json["color"],
      );

  Map<String, dynamic> toJson() => {
        "_class": primaryViewClass,
        "name": name,
        "url": url,
        "color": color == null ? null : color,
      };
}

class OverallLoad {
  OverallLoad();

  factory OverallLoad.fromJson(Map<String, dynamic> json) => OverallLoad();

  Map<String, dynamic> toJson() => {};
}

class UnlabeledLoad {
  UnlabeledLoad({
    required this.unlabeledLoadClass,
  });

  String unlabeledLoadClass;

  factory UnlabeledLoad.fromJson(Map<String, dynamic> json) => UnlabeledLoad(
        unlabeledLoadClass: json["_class"],
      );

  Map<String, dynamic> toJson() => {
        "_class": unlabeledLoadClass,
      };
}
