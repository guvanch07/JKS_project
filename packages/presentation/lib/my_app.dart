import 'package:flutter/material.dart';
import 'package:presentation/core/theme/theme_app.dart';
import 'package:presentation/pages/login/home_login/main_login.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: AppTheme.light(),
        home: const MyHomePageLogin());
  }
}
