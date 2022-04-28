class JenkinsView {
  final String? viewClass;
  final String? name;
  final String? url;

  JenkinsView({
    this.viewClass,
    this.name,
    this.url,
  });

  static JenkinsView fromJson(Map<String, dynamic> json) => JenkinsView(
        viewClass: json["_class"],
        name: json["name"],
        url: json["url"],
      );
}
