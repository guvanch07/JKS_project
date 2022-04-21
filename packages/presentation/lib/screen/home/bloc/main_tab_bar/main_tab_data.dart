import 'package:domain/model/job.dart';

class MainData {
  List<JenkinsView> views;
  int primaryViewIndex;

  MainData(
    this.views,
    this.primaryViewIndex,
  );

  factory MainData.init() => MainData([], 0);

  MainData copy() => MainData(
        views,
        primaryViewIndex,
      );
}
