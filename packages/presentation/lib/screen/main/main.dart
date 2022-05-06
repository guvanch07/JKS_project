import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:presentation/base/bloc_state.dart';
import 'package:presentation/base/stream_platform_stack_content.dart';
import 'package:presentation/mapper/main_view_mapper.dart';
import 'package:presentation/navigator/base_arguments.dart';
import 'package:presentation/navigator/base_page.dart';
import 'package:presentation/screen/main/bloc/main_bloc.dart';
import 'package:presentation/screen/main/bloc/main_data.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  static const routeName = '/MainPage';

  static BasePage page({BaseArguments? arguments}) => BasePage(
        key: const ValueKey(routeName),
        name: routeName,
        arguments: arguments,
        builder: (context) => const MainPage(),
      );

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends BlocState<MainPage, MainBloc> {
  @override
  void initState() {
    super.initState();
    bloc.initState();
  }

  @override
  void dispose() {
    bloc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return StreamPlatformStackContent(
      dataStream: bloc.dataStream,
      children: (blocData) {
        final screenData = blocData.data;
        if (screenData is MainData) {
          return _MainTabBar(
            bloc: bloc,
            screenData: screenData,
          );
        }
      },
    );
  }
}

final MainViewMapper _mainViewMapper = GetIt.I.get<MainViewMapper>();

class _MainTabBar extends StatelessWidget {
  const _MainTabBar({
    Key? key,
    required this.bloc,
    required this.screenData,
  }) : super(key: key);

  final MainBloc bloc;
  final MainData screenData;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: screenData.views.length,
      initialIndex: screenData.primaryViewIndex,
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(84),
          child: AppBar(
            bottom: TabBar(
              padding: EdgeInsets.zero,
              indicatorPadding: EdgeInsets.zero,
              labelPadding: EdgeInsets.zero,
              indicatorColor: const Color(0xFFB5E28C),
              indicatorWeight: 4,
              tabs: _mainViewMapper.mapJenkinsViewsToTabs(screenData.views),
              onTap: (index) {
                final tabName = screenData.views[index].name ?? "";

                bloc.trackTabClicked(tabName);
              },
            ),
          ),
        ),
        body: TabBarView(
          children: _mainViewMapper.mapJenkinsViewsToPages(
            screenData.views,
          ),
        ),
      ),
    );
  }
}
