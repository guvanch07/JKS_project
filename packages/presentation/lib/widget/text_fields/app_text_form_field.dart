import 'package:domain/core/extension/string_extention.dart';
import 'package:flutter/material.dart';
import 'package:presentation/core/theme/style_text.dart';
import 'package:presentation/core/theme/theme_app.dart';

bool _isHidden = true;

class AppTextField extends StatefulWidget {
  const AppTextField({
    Key? key,
    required this.text,
    this.onChanged,
    this.controller,
    this.name,
  }) : super(key: key);
  final String text;

  final Function(String value, String nameWidget)? onChanged;

  final TextEditingController? controller;
  final String? name;

  @override
  State<AppTextField> createState() => _AppTextFieldState();
}

class _AppTextFieldState extends State<AppTextField> {
  void _onChange(String? text) {
    if (widget.onChanged != null) {
      widget.onChanged?.call(text.orEmpty, widget.name ?? "");
    }
    if (widget.onChanged != null) {
      widget.onChanged?.call(text.orEmpty, widget.name ?? "");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: TextFormField(
        controller: widget.controller,
        onChanged: _onChange,
        decoration: InputDecoration(
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
          hintText: widget.text,
          hintStyle: const TextStyle(color: AppColors.textMain, fontSize: 12),
        ),
      ),
    );
  }
}
