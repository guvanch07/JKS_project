import 'dart:convert';

Welcome welcomeFromJson(String str) => Welcome.fromJson(json.decode(str));

String welcomeToJson(Welcome data) => json.encode(data.toJson());

class Welcome {
  Welcome({
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

  String welcomeClass;
  List<AssignedLabel> assignedLabels;
  String mode;
  String nodeDescription;
  String nodeName;
  int numExecutors;
  dynamic description;
  List<PrimaryView> jobs;
  OverallLoad overallLoad;
  PrimaryView primaryView;
  dynamic quietDownReason;
  bool quietingDown;
  int slaveAgentPort;
  UnlabeledLoad unlabeledLoad;
  String url;
  bool useCrumbs;
  bool useSecurity;
  List<PrimaryView> views;

  factory Welcome.fromJson(Map<String, dynamic> json) => Welcome(
        welcomeClass: json["_class"],
        assignedLabels: List<AssignedLabel>.from(
            json["assignedLabels"].map((x) => AssignedLabel.fromJson(x))),
        mode: json["mode"],
        nodeDescription: json["nodeDescription"],
        nodeName: json["nodeName"],
        numExecutors: json["numExecutors"],
        description: json["description"],
        jobs: List<PrimaryView>.from(
            json["jobs"].map((x) => PrimaryView.fromJson(x))), //!taken
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
        color: json["color"] ?? null,
      );

  Map<String, dynamic> toJson() => {
        "_class": primaryViewClass,
        "name": name,
        "url": url,
        "color": color ?? null,
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
