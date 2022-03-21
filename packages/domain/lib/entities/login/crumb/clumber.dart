import 'dart:convert';

Crumb crumbFromJson(String str) => Crumb.fromJson(json.decode(str));

String crumbToJson(Crumb data) => json.encode(data.toJson());

class Crumb {
  Crumb({
    required this.welcomeClass,
    required this.crumb,
    required this.crumbRequestField,
  });

  String welcomeClass;
  String crumb;
  String crumbRequestField;

  factory Crumb.fromJson(Map<String, dynamic> json) => Crumb(
        welcomeClass: json["_class"],
        crumb: json["crumb"],
        crumbRequestField: json["crumbRequestField"],
      );

  Map<String, dynamic> toJson() => {
        "_class": welcomeClass,
        "crumb": crumb,
        "crumbRequestField": crumbRequestField,
      };
}
