import 'package:flutter/material.dart';
import 'package:presentation/pages/card/card_main.dart';
import 'package:presentation/pages/login/home_login/main_login.dart';

class AppRouter {
  static Route onGenerateRoute(
    RouteSettings settings,
  ) {
    return MaterialPageRoute<void>(builder: (BuildContext context) {
      switch (settings.name) {
        case MyHomePageLogin.routeName:
          return const MyHomePageLogin();

        case CardMainPage.routeName:
          return const CardMainPage();

        default:
          return const SizedBox();
      }
    });
  }
}
