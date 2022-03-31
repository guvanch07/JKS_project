import 'package:domain/core/extension/title_exctention.dart';
import 'package:flutter/material.dart';
import 'package:presentation/core/theme/theme_app.dart';
import 'package:presentation/navigator/base_argumaents.dart';
import 'package:presentation/navigator/base_page.dart';
import 'package:presentation/screen/home/home_page.dart';
import 'package:flutter_svg/flutter_svg.dart';

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
  static const routeName = "/Home";

  static BasePage page({BaseArguments? arguments}) => BasePage(
      key: const ValueKey(routeName),
      name: routeName,
      arguments: arguments,
      builder: (context) => const HomeTabBar());
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
