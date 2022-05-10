import 'package:domain/model/job/job_info_model.dart';

class BuildPostModel {
  JobInfoModel jobInfoModel;
  Map<String, String> params;
  BuildPostModel(
    this.jobInfoModel,
    this.params,
  );
}
