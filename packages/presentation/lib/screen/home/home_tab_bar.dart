import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:presentation/core/theme/theme_app.dart';
import 'package:presentation/navigator/base_argumaents.dart';
import 'package:presentation/navigator/base_page.dart';

const List<Tab> _myMainTabs = <Tab>[
  Tab(text: "Card ES"),
  Tab(text: "Card MX"),
  Tab(text: "MMES"),
];

const List<Widget> _myWidgets = [TestSvg(), TestSvg(), TestSvg()];

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
          bottom: const TabBar(
              labelStyle: TextStyle(fontSize: 10), tabs: _myMainTabs),
        ),
      ),
    );
  }
}

class TestSvg extends StatelessWidget {
  const TestSvg({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(child: SvgPicture.asset("assets/svg/catty.svg"));
  }
}
