import 'package:flutter/material.dart';
import 'package:presentation/core/theme/theme_app.dart';

class LoginTextField extends StatelessWidget {
  const LoginTextField({
    Key? key,
    required this.text,
    this.type,
    required this.obscure,
    this.widget,
    required this.onChanged,
    this.onSaved,
    this.error,
    this.validator,
    required this.keyState,
    this.iniialValue,
  }) : super(key: key);
  final String text;
  final TextInputType? type;
  final bool obscure;
  final Widget? widget;
  final Function(String)? onChanged;
  final Function(String?)? onSaved;
  final String? error;
  final String? Function(String?)? validator;
  final GlobalKey<FormFieldState<dynamic>> keyState;
  final String? iniialValue;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: TextFormField(
        initialValue: iniialValue,
        key: keyState,
        keyboardType: type,
        obscureText: obscure,
        onChanged: onChanged,
        onSaved: onSaved,
        validator: validator, //! it is only for second method
        decoration: InputDecoration(
          errorText: error,
          suffixIcon: widget,
          focusColor: Colors.black,
          focusedErrorBorder: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(10.0)),
              borderSide: BorderSide(color: AppColors.errorColor)),
          fillColor: Colors.white,
          contentPadding: const EdgeInsets.all(16),
          focusedBorder: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(10.0)),
              borderSide: BorderSide(color: AppColors.border)),
          enabledBorder: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(10.0)),
              borderSide: BorderSide(color: AppColors.border)),
          border: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(10.0)),
              borderSide: BorderSide(color: AppColors.accentOrange)),
          errorBorder: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(10.0)),
              borderSide: BorderSide(color: AppColors.accentOrange)),
          hintText: text,
          hintStyle: const TextStyle(color: AppColors.textMain, fontSize: 12),
        ),
      ),
    );
  }
}
