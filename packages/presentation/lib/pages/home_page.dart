import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:presentation/core/theme/theme_app.dart';
import 'package:presentation/pages/card/card_item.dart';
import 'package:presentation/pages/card/card_main.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({
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
                builder: (context) => const CardMainPage(),
              );

            case 1:
              return CupertinoTabView(
                builder: (context) => const CardItemPage(),
              );

            default:
              return Container(
                color: Colors.amber,
              );
          }
        });
  }
}
