

import 'package:flutter/material.dart';

import '../ratio/sizer_ratio.dart';
import '../theme/theme_app.dart';

class PrimaryButton extends StatelessWidget {
  const PrimaryButton({
    Key? key,
    required this.onTap,
    required this.text,
  }) : super(key: key);
  final VoidCallback onTap;
  final String text;
  @override
  Widget build(BuildContext context) {
    final height = getHeightRatio(context);
    final width = getWidthRatio(context);
    return MaterialButton(
      onPressed: onTap,
      child: Text(text),
      height: height * 56,
      minWidth: width * 343,
      color: AppColors.accentOrange,
      textColor: Colors.white,
    );
  }
}
