class ApiCrumbResponseModel {
  String? sClass;
  String? crumb;
  String? crumbRequestField;

  ApiCrumbResponseModel({
    this.sClass,
    this.crumb,
    this.crumbRequestField,
  });

  ApiCrumbResponseModel.fromJson(Map<String, dynamic> json) {
    crumb = json['crumb'];
    crumbRequestField = json['crumbRequestField'];
  }
}
