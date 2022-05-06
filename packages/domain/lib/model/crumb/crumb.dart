class Crumb {
  Crumb({
    required this.welcomeClass,
    required this.crumb,
    required this.crumbRequestField,
  });

  final String welcomeClass;
  final String crumb;
  final String crumbRequestField;

  factory Crumb.fromJson(Map<String, dynamic> json) => Crumb(
        welcomeClass: json["_class"] ?? [],
        crumb: json["crumb"] ?? [],
        crumbRequestField: json["crumbRequestField"] ?? [],
      );

  Map<String, dynamic> toJson() => {
        "_class": welcomeClass,
        "crumb": crumb,
        "crumbRequestField": crumbRequestField,
      };
}
