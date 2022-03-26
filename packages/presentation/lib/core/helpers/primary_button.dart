

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
      disabledColor: Colors.red,
      
      onPressed: onTap,
      child: Text(text,style: const TextStyle(fontSize: 24),),
      height: height * 50,
      minWidth: width * 343,
      color: AppColors.accentOrange,
      textColor: Colors.white,
     
    );
  }
}
