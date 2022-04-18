import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:presentation/base/bloc_state.dart';
import 'package:presentation/base/stream_platform_stack_content.dart';
import 'package:presentation/core/theme/theme_app.dart';
import 'package:presentation/navigator/base_argumaents.dart';
import 'package:presentation/navigator/base_page.dart';
import 'package:presentation/screen/home/bloc/main_tab_bar/main_tab_data.dart';
import 'package:presentation/screen/mapper/tab_bar_mapper.dart';

import 'bloc/main_tab_bar/main_tab_bloc.dart';

class MainTab extends StatefulWidget {
  const MainTab({Key? key}) : super(key: key);

  static const routeName = "/Home";

  static BasePage page({BaseArguments? arguments}) => BasePage(
      key: const ValueKey(routeName),
      name: routeName,
      arguments: arguments,
      builder: (context) => const MainTab());

  @override
  State<MainTab> createState() => _MainTabState();
}

class _MainTabState extends BlocState<MainTab, MainBloc> {
  @override
  void initState() {
    super.initState();
    bloc.initState();
  }

  @override
  void dispose() {
    super.dispose();
    bloc.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return StreamPlatformStackContent(
      dataStream: bloc.dataStream,
      children: (blocData) {
        final screenData = blocData.data;
        if (screenData is MainData) {
          return _ItemTabBar(
            screenData: screenData,
          );
        }
      },
    );
  }
}

final MainViewMapper _mainViewMapper = GetIt.I.get<MainViewMapper>();

class _ItemTabBar extends StatelessWidget {
  const _ItemTabBar({
    Key? key,
    required this.screenData,
  }) : super(key: key);

  final MainData screenData;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: _mainViewMapper.mapJenkinsViewsToTabs(screenData.views).length,
      child: Scaffold(
        body: TabBarView(
            children: _mainViewMapper.mapJenkinsViewsToPages(screenData.views)),
        appBar: AppBar(
          backgroundColor: AppColors.accentGreen,
          bottom: PreferredSize(
            preferredSize: const Size.fromHeight(20),
            child: TabBar(
                labelStyle: const TextStyle(fontSize: 10),
                tabs: _mainViewMapper.mapJenkinsViewsToTabs(screenData.views)),
          ),
        ),
      ),
    );
  }
}
