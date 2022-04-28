import 'package:flutter/material.dart';
import 'package:domain/model/views/views_model.dart';
import 'package:presentation/mapper/asset_mapper.dart';
import 'package:presentation/screen/home/home.dart';
import 'package:presentation/widget/tab_bar_item.dart';
import 'package:get_it/get_it.dart';

abstract class MainViewMapper {
  factory MainViewMapper() => _MainViewMapper();

  List<Widget> mapJenkinsViewsToPages(List<JenkinsView> views);

  List<Widget> mapJenkinsViewsToTabs(List<JenkinsView> views);
}

class _MainViewMapper implements MainViewMapper {
  final AssetMapper _mainViewMapper = GetIt.I.get<AssetMapper>();
  @override
  List<Widget> mapJenkinsViewsToPages(List<JenkinsView> views) => views
      .map(
        (view) => HomePage(view: view.name),
      )
      .toList();

  @override
  List<Widget> mapJenkinsViewsToTabs(List<JenkinsView> views) => views
      .map(
        (view) => TabBarItem(
          asset: _mainViewMapper.mappingAssets(view.name ?? ""),
          title: view.name?.toUpperCase() ?? "",
        ),
      )
      .toList();
}
