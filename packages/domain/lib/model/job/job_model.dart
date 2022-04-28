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
}
