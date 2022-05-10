import 'package:flutter/material.dart';
import 'package:presentation/core/theme/style_text.dart';
import 'package:presentation/core/theme/theme_app.dart';

class CustomToggleButtonWidget extends StatefulWidget {
  const CustomToggleButtonWidget({
    Key? key,
    required this.listNameButton,
    required this.initialIndex,
    this.name,
    this.onChangeValue,
  }) : super(key: key);

  final String? name;

  final void Function(String value, String nameWidget)? onChangeValue;
  final List<String> listNameButton;
  final int initialIndex;

  @override
  State<CustomToggleButtonWidget> createState() =>
      _CustomToggleButtonWidgetState();
}

class _CustomToggleButtonWidgetState extends State<CustomToggleButtonWidget> {
  final List<bool> listState = [];

  void _onPressed(int index) {
    if (listState[index] != true) {
      setState(
        () {
          listState[listState.indexWhere((element) => element)] = false;
          listState[index] = true;
          if (widget.onChangeValue != null) {
            widget.onChangeValue!(
                widget.listNameButton[index], widget.name ?? '');
          }
        },
      );
    }
  }

  @override
  void initState() {
    listState.addAll(
      List.filled(widget.listNameButton.length, false),
    );
    listState[widget.initialIndex] = true;
    if (widget.onChangeValue != null) {
      widget.onChangeValue!(
          widget.listNameButton[widget.initialIndex], widget.name ?? "");
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.black.withOpacity(0.15),
        borderRadius: const BorderRadius.all(
          Radius.circular(4),
        ),
      ),
      child: Row(
          children: widget.listNameButton
              .asMap()
              .entries
              .map(
                (entrie) => _ButtonToggle(
                  activeButton: listState[entrie.key],
                  onTap: () => _onPressed(entrie.key),
                  textButton: entrie.value,
                ),
              )
              .toList()),
    );
  }
}

class _ButtonToggle extends StatelessWidget {
  const _ButtonToggle({
    Key? key,
    required this.activeButton,
    required this.onTap,
    required this.textButton,
  }) : super(key: key);

  final bool activeButton;
  final void Function() onTap;
  final String textButton;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: InkWell(
        onTap: activeButton ? null : onTap,
        child: Container(
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(
              Radius.circular(4),
            ),
            color: activeButton ? AppColors.card : Colors.transparent,
            boxShadow: activeButton
                ? [
                    BoxShadow(
                      color: Colors.white.withOpacity(0.1),
                      offset: const Offset(0, 2),
                      blurRadius: 8,
                    ),
                  ]
                : [
                    const BoxShadow(
                      color: Colors.white,
                      offset: Offset(0, 2),
                      blurRadius: 4,
                    ),
                  ],
          ),
          child: SizedBox.expand(
            child: Align(
              alignment: Alignment.center,
              child: Text(
                textButton,
                textAlign: TextAlign.center,
                style: activeButton ? Styles.headline1 : Styles.headline2,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
