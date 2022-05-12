import 'package:flutter/material.dart';
import 'package:presentation/core/theme/style_text.dart';
import 'package:presentation/widget/text_fields/app_text_form_field.dart';
import 'package:domain/core/extension/string_extention.dart';

class TextFieldWithTitleWidget extends StatelessWidget {
  const TextFieldWithTitleWidget({
    Key? key,
    this.onChangeValue,
    this.hintText,
    this.nameWidget,
    this.defaultValue,
  }) : super(key: key);

  final void Function(String value, String widgetName)? onChangeValue;
  final String? hintText;
  final String? nameWidget;
  final String? defaultValue;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          nameWidget.orEmpty,
          style: Styles.headline2,
        ),
        const SizedBox(
          height: 8,
        ),
        AppTextField(
          onChanged: onChangeValue,
          text: hintText ?? "",
          controller: defaultValue != null
              ? TextEditingController(text: defaultValue)
              : null,
        ),
        const SizedBox(
          height: 24,
        ),
      ],
    );
  }
}
