import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class TabsItem extends StatelessWidget {
  const TabsItem({
    Key? key,
    required this.title,
  }) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return Tab(
      text: title,
      icon: SvgPicture.asset("assets/svg/tab1.svg"),
    );
  }
}
