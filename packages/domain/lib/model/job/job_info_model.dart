class JobInfoModel {
  String job;
  String view;

  JobInfoModel(
    this.job,
    this.view,
  );

  factory JobInfoModel.init() => JobInfoModel(
        '',
        '',
      );
}
