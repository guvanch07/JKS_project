import 'package:flutter/material.dart';
import 'package:domain/core/extension/string_extention.dart';
import 'package:presentation/core/theme/style_text.dart';
import 'package:presentation/widget/toggle_button/main_toggle.dart';

class CustomToggleWithTitle extends StatelessWidget {
  const CustomToggleWithTitle({
    Key? key,
    this.name,
    this.onChangeValue,
    required this.listNameButton,
    required this.initialIndex,
  }) : super(key: key);

  final String? name;
  final void Function(String value)? onChangeValue;
  final List<String> listNameButton;
  final int initialIndex;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          name.orEmpty,
          style: Styles.headline2,
        ),
        const SizedBox(
          height: 8,
        ),
        CustomToggleButtonWidget(
          name: name,
          onChangeValue: onChangeValue,
          listNameButton: listNameButton,
          initialIndex: 0,
        ),
        const SizedBox(
          height: 24,
        ),
      ],
    );
  }
}
