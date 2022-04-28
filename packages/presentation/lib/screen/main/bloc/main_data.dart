import 'package:domain/model/views/views_model.dart';

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
