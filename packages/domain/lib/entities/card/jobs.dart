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
