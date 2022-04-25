import 'package:flutter/material.dart';
import 'package:presentation/core/theme/style_text.dart';
import 'package:presentation/core/theme/theme_app.dart';

bool _isHidden = true;

class AppTextField extends StatelessWidget {
  const AppTextField({
    Key? key,
    required this.text,
    this.type,
    required this.obscure,
    this.onChanged,
    this.onSaved,
    this.validator,
    this.keyState,
    this.focusNode,
    required this.isSuffixExsist,
  }) : super(key: key);
  final String text;
  final TextInputType? type;
  final bool obscure;
  final Function(String)? onChanged;
  final Function(String?)? onSaved;
  final String? Function(String?)? validator;
  final GlobalKey? keyState;
  final FocusNode? focusNode;
  final bool isSuffixExsist;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: TextFormField(
        key: keyState,
        keyboardType: type,
        obscureText: obscure == _isHidden,
        onChanged: onChanged,
        onSaved: onSaved,
        focusNode: focusNode,
        validator: validator,
        decoration: InputDecoration(
          suffixIcon: isSuffixExsist
              ? StatefulBuilder(builder: (context, setState) {
                  return IconButton(
                    color: AppColors.border,
                    icon: Icon(
                      _isHidden ? Icons.visibility : Icons.visibility_off,
                    ),
                    onPressed: () {
                      setState(() => _isHidden = !_isHidden);
                    },
                  );
                })
              : const SizedBox(),
          errorStyle: Styles.headline1.copyWith(color: AppColors.errorColor),
          focusColor: Colors.black,
          focusedErrorBorder: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(10.0)),
              borderSide: BorderSide(color: AppColors.errorColor)),
          fillColor: Colors.white,
          contentPadding: const EdgeInsets.all(16),
          focusedBorder: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(10.0)),
              borderSide: BorderSide(color: AppColors.accentGreen)),
          enabledBorder: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(10.0)),
              borderSide: BorderSide(color: AppColors.accentOrange)),
          border: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(10.0)),
              borderSide: BorderSide(color: AppColors.border)),
          errorBorder: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(10.0)),
              borderSide: BorderSide(color: AppColors.errorColor)),
          hintText: text,
          hintStyle: const TextStyle(color: AppColors.textMain, fontSize: 12),
        ),
      ),
    );
  }
}
