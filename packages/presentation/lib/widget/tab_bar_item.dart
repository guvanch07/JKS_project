import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class TabBarItem extends StatelessWidget {
  const TabBarItem({
    Key? key,
    required this.title,
    required this.asset,
  }) : super(key: key);

  final String title;
  final String asset;

  @override
  Widget build(BuildContext context) {
    return Tab(
      height: 66,
      icon: SvgPicture.asset(asset),
      text: title,
    );
  }
}
