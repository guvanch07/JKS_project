import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:presentation/core/theme/theme_app.dart';
import 'package:presentation/screen/home/home_page.dart';

class HomeTabBar extends StatelessWidget {
  const HomeTabBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CupertinoTabScaffold(
        tabBar: CupertinoTabBar(
            height: 50,
            backgroundColor: const Color(0xffFFFFFF),
            activeColor: AppColors.accentGreen,
            iconSize: 25,
            items: const [
              BottomNavigationBarItem(
                icon: Icon(Icons.build),
                label: 'Build',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.flag),
                label: 'Prod',
              ),
            ]),
        tabBuilder: (BuildContext context, int index) {
          switch (index) {
            case 0:
              return CupertinoTabView(
                builder: (context) => const MyHomePage(),
              );

            case 1:
              return CupertinoTabView(
                builder: (context) => const MyHomePage(),
              );

            default:
              return Container(
                color: Colors.amber,
              );
          }
        });
  }
}
