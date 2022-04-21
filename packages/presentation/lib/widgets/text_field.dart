import 'package:flutter/material.dart';
import 'package:presentation/core/theme/style_text.dart';
import 'package:presentation/core/theme/theme_app.dart';

class AppTextField extends StatefulWidget {
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
  State<AppTextField> createState() => _AppTextFieldState();
}

class _AppTextFieldState extends State<AppTextField> {
  bool _isHidden = true;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: TextFormField(
        key: widget.keyState,
        keyboardType: widget.type,
        obscureText: widget.obscure == _isHidden,
        onChanged: widget.onChanged,
        onSaved: widget.onSaved,
        focusNode: widget.focusNode,
        validator: widget.validator,
        decoration: InputDecoration(
          suffixIcon: widget.isSuffixExsist
              ? IconButton(
                  color: AppColors.border,
                  icon: Icon(
                    _isHidden ? Icons.visibility : Icons.visibility_off,
                  ),
                  onPressed: () {
                    setState(() => _isHidden = !_isHidden);
                  },
                )
              : const SizedBox(),
          errorStyle: headline1.copyWith(color: AppColors.errorColor),
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
          hintText: widget.text,
          hintStyle: const TextStyle(color: AppColors.textMain, fontSize: 12),
        ),
      ),
    );
  }
}
