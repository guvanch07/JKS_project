import 'package:domain/core/extension/title_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:presentation/core/theme/theme_app.dart';
import 'package:presentation/screen/home/home_page.dart';

final List<Tab> _myMainTabs = <Tab>[
  Tab(text: "Card ES", icon: SvgPicture.asset('assets/svg/tab3.svg')),
  Tab(text: "Card MX", icon: SvgPicture.asset('assets/svg/tab2.svg')),
  Tab(text: "MMES", icon: SvgPicture.asset('assets/svg/tab1.svg')),
];

const List<Widget> _myWidgets = [
  HomePage(project: TitleOfTabBar.cardEs),
  HomePage(project: TitleOfTabBar.cardMx),
  HomePage(project: TitleOfTabBar.mmEs)
];

class HomeTabBar extends StatelessWidget {
  const HomeTabBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: _myMainTabs.length,
      child: Scaffold(
        body: const TabBarView(children: _myWidgets),
        appBar: AppBar(
          backgroundColor: AppColors.accentGreen,
          bottom: PreferredSize(
            preferredSize: const Size.fromHeight(20),
            child: TabBar(
                labelStyle: const TextStyle(fontSize: 10), tabs: _myMainTabs),
          ),
        ),
      ),
    );
  }
}
