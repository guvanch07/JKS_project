import 'package:flutter/material.dart';
import 'package:presentation/navigator/base_arguments.dart';

class BasePage<T extends BaseArguments> extends Page {
  const BasePage({
    required LocalKey key,
    required String name,
    required this.builder,
    this.showSlideAnim = false,
    T? arguments,
  }) : super(arguments: arguments, key: key, name: name);

  final WidgetBuilder builder;
  final bool showSlideAnim;

  @override
  Route createRoute(BuildContext context) => _AppRoute(
    builder: builder,
    showSlideAnim: showSlideAnim,
    settings: this,
  );
}

class _AppRoute extends MaterialPageRoute {
  _AppRoute({
    required WidgetBuilder builder,
    RouteSettings? settings,
    this.showSlideAnim = false,
  }) : super(builder: builder, settings: settings);

  final bool showSlideAnim;

  @override
  Widget buildTransitions(BuildContext context, Animation<double> animation,
      Animation<double> secondaryAnimation, Widget child) {
    if (!showSlideAnim) {
      return FadeTransition(
        opacity: animation,
        child: child,
      );
    }
    return Theme.of(context).pageTransitionsTheme.buildTransitions(
      this,
      context,
      animation,
      secondaryAnimation,
      child,
    );
  }
}