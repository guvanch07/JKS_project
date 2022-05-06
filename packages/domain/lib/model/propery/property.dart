class Property {
  String? description;
  String? name;
  String? type;
  String? defaultValue;
  List<String>? choices;

  Property({
    this.description,
    this.name,
    this.type,
    this.defaultValue,
    this.choices,
  });

  static Property fromJson(Map<String, dynamic> json) => Property(
        description: json["description"],
        name: json["name"],
        type: json["type"],
        defaultValue: json["defaultValue"],
        choices: json["choices"],
      );
}
