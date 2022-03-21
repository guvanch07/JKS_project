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
