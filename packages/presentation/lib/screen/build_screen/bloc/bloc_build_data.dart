import 'package:domain/model/job/job_info_model.dart';
import 'package:domain/model/propery/property.dart';

class BuildData {
  List<Property>? property;
  JobInfoModel jobInfoModel;
  Map<String, String> valueWidgets;
  BuildData(
    this.property,
    this.jobInfoModel,
    this.valueWidgets,
  );

  factory BuildData.init() => BuildData(null, JobInfoModel("", ""), {});

  BuildData copy() => BuildData(property, jobInfoModel, valueWidgets);
}
