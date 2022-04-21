class Job {
  final String? jobClass;
  final String? name;
  final String? url;
  final String? color;

  Job({
    this.jobClass,
    this.name,
    this.url,
    this.color,
  });

  static Job fromJson(Map<String, dynamic> json) => Job(
        jobClass: json["_class"],
        name: json["name"],
        url: json["url"],
        color: json["color"],
      );

  Map<String, dynamic> toJson() => {
        "_class": jobClass,
        "name": name,
        "url": url,
        "color": color,
      };
}

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
