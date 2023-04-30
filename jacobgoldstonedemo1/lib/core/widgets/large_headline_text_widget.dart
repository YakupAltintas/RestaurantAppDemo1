import 'package:flutter/material.dart';
import 'package:jacobgoldstonedemo1/core/project_theme/project_colors.dart';

class LargeText extends StatelessWidget with ProjectColors {
  LargeText({super.key, required this.text});
  final String text;
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: Theme.of(context).textTheme.headlineMedium?.copyWith(
        fontWeight: FontWeight.w400,
        color: generalTextColor,
      ),
    );
  }
}
