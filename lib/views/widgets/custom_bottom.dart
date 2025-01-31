import 'package:flutter/material.dart';
import 'package:quiz_app/core/constants/app_text_style.dart';

// ignore: must_be_immutable
class CustomBottom extends StatelessWidget {
  Function() onTap;
  String title;
  Color color;

  CustomBottom({
    super.key,
    required this.onTap,
    required this.title,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Ink(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(vertical: 10),
        decoration:
            BoxDecoration(borderRadius: BorderRadius.circular(6), color: color),
        child: Center(
          child: Text(title,
              style: AppTextStyle.s15w4cP
                  .copyWith(color: Colors.white, fontWeight: FontWeight.bold)),
        ),
      ),
    );
  }
}
