import 'package:domain/core/extension/string_extention.dart';
import 'package:domain/model/propery/property.dart';
import 'package:flutter/material.dart';
import 'package:presentation/widget/text_fields/text_fields_with_title.dart';
import 'package:presentation/widget/toggle_button/toogle_with_title.dart';

part 'widgets_build.dart';

abstract class BuildScreenMapper {
  factory BuildScreenMapper() => _BuildScreenMapper();

  List<Widget> mapPropertyText(
    List<Property>? data,
    void Function(String value, String nameWidget)? onChangeValue,
  );
}

class _BuildScreenMapper implements BuildScreenMapper {
  @override
  List<Widget> mapPropertyText(List<Property>? data,
      void Function(String value, String nameWidget)? onChangeValue) {
    List<Widget> listWidgets = [];

    final listResponse = data;

    if (listResponse == null) {
      return [Container(color: Colors.black)];
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
          [Container(color: Colors.black)];
      }
    }
    return listWidgets;
  }
}
