part of 'build_mapper.dart';

class _GetStringParametDefinition extends StatelessWidget {
  const _GetStringParametDefinition({
    Key? key,
    required this.buildResponse,
    this.onChangeValue,
  }) : super(key: key);

  final Property buildResponse;
  final void Function(String value)? onChangeValue;

  @override
  Widget build(BuildContext context) {
    return TextFieldWithTitleWidget(
      hintText: buildResponse.description.orEmpty,
      nameWidget: buildResponse.name,
      onChangeValue: onChangeValue,
      defaultValue: buildResponse.defaultValue,
    );
  }
}

class _GetChoiceParameterDefinitions extends StatelessWidget {
  const _GetChoiceParameterDefinitions({
    Key? key,
    required this.buildResponse,
    this.onChangeValue,
  }) : super(key: key);

  final Property buildResponse;
  final void Function(String value)? onChangeValue;

  @override
  Widget build(BuildContext context) {
    int initIndex = buildResponse.choices
            ?.indexWhere((element) => element == buildResponse.defaultValue) ??
        0;
    return CustomToggleWithTitle(
      listNameButton: buildResponse.choices ?? [],
      initialIndex: initIndex,
      onChangeValue: onChangeValue,
      name: buildResponse.name,
    );
  }
}
