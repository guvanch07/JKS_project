import 'package:domain/model/job.dart';
import 'package:flutter/material.dart';
import 'package:presentation/screen/home/home_page.dart';
import 'package:presentation/widgets/tab_helper.dart';

abstract class MainViewMapper {
  factory MainViewMapper() => _MainViewMapper();

  List<Widget> mapJenkinsViewsToPages(List<JenkinsView> views);

  List<Widget> mapJenkinsViewsToTabs(List<JenkinsView> views);
}

class _MainViewMapper implements MainViewMapper {
  @override
  List<Widget> mapJenkinsViewsToPages(List<JenkinsView> views) => views
      .map(
        (view) => HomePage(title: view.name), //! giving the names from network
      )
      .toList();

  @override
  List<Widget> mapJenkinsViewsToTabs(List<JenkinsView> views) => views
      .map(
        (view) => TabsItem(
          title: view.name?.toUpperCase() ?? "",
        ),
      )
      .toList();
}
