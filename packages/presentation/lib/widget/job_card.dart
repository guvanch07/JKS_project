import 'package:flutter/material.dart';
import 'package:presentation/core/theme/style_text.dart';

class JobCards extends StatelessWidget {
  final String? title;
  final Color color;
  final VoidCallback onTap;

  const JobCards({
    Key? key,
    required this.title,
    required this.color,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => InkWell(
        onTap: onTap,
        child: Container(
          height: 80,
          padding: const EdgeInsets.symmetric(horizontal: 5),
          margin: const EdgeInsets.only(bottom: 24),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: const BorderRadius.all(Radius.circular(16)),
            boxShadow: [
              BoxShadow(
                  color: Colors.black.withOpacity(0.16),
                  offset: const Offset(0, 1),
                  blurRadius: 2),
              BoxShadow(
                  color: Colors.black.withOpacity(0.04),
                  offset: const Offset(0, 1),
                  blurRadius: 2),
              BoxShadow(
                  color: Colors.black.withOpacity(0.08),
                  offset: const Offset(0, 1),
                  blurRadius: 6)
            ],
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Container(
                width: 15,
                height: 15,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: color,
                ),
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.5,
                child: Text(
                  title ?? "",
                  style: Styles.headline2,
                  textAlign: TextAlign.center,
                ),
              ),
              const Icon(Icons.arrow_forward_ios, size: 15),
            ],
          ),
        ),
      );
}
