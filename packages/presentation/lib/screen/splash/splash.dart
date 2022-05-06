import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:presentation/base/bloc_state.dart';
import 'package:presentation/core/theme/style_text.dart';
import 'package:presentation/core/theme/theme_app.dart';
import 'package:presentation/navigator/base_arguments.dart';
import 'package:presentation/navigator/base_page.dart';
import 'package:presentation/screen/splash/bloc/splash_bloc.dart';

class SplashScreen extends StatefulWidget {
  static const routeName = '/SpalshPage';
  const SplashScreen({Key? key}) : super(key: key);

  static BasePage page({BaseArguments? arguments}) => BasePage(
        key: const ValueKey(routeName),
        name: routeName,
        arguments: arguments,
        builder: (context) => const SplashScreen(),
      );

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends BlocState<SplashScreen, SplashBloc> {
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
    return Scaffold(
      backgroundColor: AppColors.accentGreen,
      body: SafeArea(
          child: Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          SvgPicture.asset("assets/svg/jenkis.svg"),
          const SizedBox(height: 20),
          const Text("JenkisApp", style: Styles.splashHeadLine1),
          const Text("App for building something great",
              style: Styles.splashHeadLine2),
        ]),
      )),
    );
  }
}
