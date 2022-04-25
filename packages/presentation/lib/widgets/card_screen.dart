import 'package:flutter/material.dart';
import 'package:presentation/core/ratio/sizer_ratio.dart';
import 'package:presentation/core/theme/style_text.dart';

class CardItem extends StatelessWidget {
  const CardItem({
    Key? key,
    required this.maintitlle,
    required this.color,
  }) : super(key: key);

  final String maintitlle;

  final Color color;

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
            decoration: BoxDecoration(shape: BoxShape.circle, color: color),
          ),
          Text(maintitlle, style: Styles.headline1),
          const Icon(Icons.arrow_forward_ios)
        ],
      ),
    );
  }
}
