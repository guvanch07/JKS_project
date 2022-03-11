import 'package:flutter/material.dart';
import 'package:presentation/core/theme/theme_app.dart';

class CardItemPage extends StatefulWidget {
  const CardItemPage({Key? key}) : super(key: key);

  @override
  State<CardItemPage> createState() => _CardItemPageState();
}

class _CardItemPageState extends State<CardItemPage> {
  List<bool> isSelected = [true, false];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.mainbgc,
      body: Center(
        child: ToggleButtons(
          renderBorder: false,
          disabledBorderColor: Colors.transparent,
          borderColor: Colors.transparent,
          fillColor: AppColors.accentGreen,
          borderWidth: 0,
          selectedBorderColor: Colors.black,
          selectedColor: Colors.white,
          borderRadius: const BorderRadius.all(Radius.circular(10)),
          children: const <Widget>[
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                'Open 24 Hours',
                style: TextStyle(fontSize: 16),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                'Custom Hours',
                style: TextStyle(fontSize: 16),
              ),
            ),
          ],
          onPressed: (int index) {
            setState(() {
              for (int i = 0; i < isSelected.length; i++) {
                isSelected[i] = i == index;
              }
            });
          },
          isSelected: isSelected,
        ),
      ),
    );
  }
}
