import 'package:flutter/material.dart';
import 'package:presentation/core/ratio/sizer_ratio.dart';
import 'package:presentation/core/theme/style_text.dart';

class CardItem extends StatelessWidget {
  const CardItem({
    Key? key,
    //required this.flag,
    required this.maintitlle,
    required this.color,
  }) : super(key: key);
  //final String flag;
  final String maintitlle;

  final String color;

  @override
  Widget build(BuildContext context) {
    final height = getHeightRatio(context);
    return Container(
      height: height * 80,
      padding: const EdgeInsets.symmetric(horizontal: 15),
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: const [
          BoxShadow(
              color: Colors.grey,
              spreadRadius: 0.2,
              blurRadius: 2,
              offset: Offset(1, 1)),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Container(
            width: 16,
            height: 16,
            decoration: BoxDecoration(
                shape: BoxShape.circle, color: stringToColor(color)),
          ),
          Text(stringToString(maintitlle), style: headline1),
          const Icon(Icons.arrow_forward_ios)
        ],
      ),
    );
  }

  Color? stringToColor(String color) {
    if (color.contains("red")) {
      return Colors.red;
    } else {
      return Colors.blue;
    }
  }

  String stringToString(String title) {
    if (title.contains("moneyman")) {
      return "Moneyman";
    } else {
      return "Plazo";
    }
  }
}
