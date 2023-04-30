import 'package:flutter/material.dart';
import 'package:jacobgoldstonedemo1/core/project_theme/project_colors.dart';

class MediumText extends StatelessWidget with ProjectColors {
  MediumText({super.key, required this.text});
  final String text;
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: Theme.of(context).textTheme.headlineSmall?.copyWith(
        fontWeight: FontWeight.w400,
        color: generalTextColor,
      ),
    );
  }
}
