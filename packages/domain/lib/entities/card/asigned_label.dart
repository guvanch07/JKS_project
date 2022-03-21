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
