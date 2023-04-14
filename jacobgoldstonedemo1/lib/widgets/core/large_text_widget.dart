import 'package:flutter/material.dart';
import 'package:jacobgoldstonedemo1/project_theme/project_colors.dart';

class LargeText extends StatelessWidget with ProjectColors {
  LargeText({super.key, required this.text, required this.size});
  final String text;
  final double size;
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontWeight: FontWeight.w400,
        color: generalTextColor,
        fontSize: size,
      ),
    );
  }
}
