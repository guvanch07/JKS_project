
import 'package:flutter/material.dart';

import '../theme/theme_app.dart';

class SearchTextField extends StatelessWidget {
  const SearchTextField({
    Key? key,
    required this.text,
    this.type,
    required this.obscure,
  }) : super(key: key);
  final String text;
  final TextInputType? type;
  final bool obscure;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: TextField(
        keyboardType: type,
        obscureText: obscure,
        decoration: InputDecoration(
            fillColor: AppColors.card,
            contentPadding: const EdgeInsets.all(16),
            focusedBorder:  const OutlineInputBorder(
                borderRadius:  BorderRadius.all(Radius.circular(10.0)),
                borderSide:  BorderSide(color: Colors.black)),
            enabledBorder: const OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(10.0)),
                borderSide: BorderSide(color: AppColors.accentGreen)),
            border:  const OutlineInputBorder(
                borderRadius: BorderRadius.all( Radius.circular(10.0)),
                borderSide: BorderSide(color: AppColors.border)),
                errorBorder: const OutlineInputBorder(
                borderRadius:  BorderRadius.all(Radius.circular(10.0)),
                borderSide: BorderSide(color: AppColors.errorColor)),
            hintText: text,
            hintStyle: Theme.of(context).textTheme.headline2!.copyWith(color: AppColors.textMain),),
      ),
    );
  }
}
