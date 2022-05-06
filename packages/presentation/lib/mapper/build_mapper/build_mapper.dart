import 'package:domain/core/extension/string_extention.dart';
import 'package:domain/model/propery/property.dart';
import 'package:flutter/material.dart';
import 'package:presentation/widget/text_fields/text_fields_with_title.dart';
import 'package:presentation/widget/toggle_button/toogle_with_title.dart';

part 'widgets_build.dart';

abstract class BuildMapper {
  factory BuildMapper() => _BuildMapper();

  List<Widget> mapPropertyText(
    List<Property>? data,
    void Function(String value)? onChangeValue,
  );
}

class _BuildMapper implements BuildMapper {
  @override
  List<Widget> mapPropertyText(
      List<Property>? data, void Function(String value)? onChangeValue) {
    List<Widget> listWidgets = [];

    final listResponse = data;

    if (listResponse == null) {
      return [const SizedBox()];
    }

    for (var buildBuilder in listResponse) {
      switch (buildBuilder.type) {
        case 'StringParameterDefinition':
          listWidgets.add(
            _GetStringParametDefinition(
              buildResponse: buildBuilder,
              onChangeValue: onChangeValue,
            ),
          );
          break;
        case 'ChoiceParameterDefinition':
          listWidgets.add(
            _GetChoiceParameterDefinitions(
              buildResponse: buildBuilder,
              onChangeValue: onChangeValue,
            ),
          );
          break;
        default:
          [const SizedBox()];
      }
    }
    return listWidgets;
  }
}
