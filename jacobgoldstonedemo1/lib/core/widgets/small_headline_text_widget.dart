import 'package:flutter/material.dart';
import 'package:jacobgoldstonedemo1/core/project_theme/project_colors.dart';

class SmallTitle extends StatelessWidget with ProjectColors {
  SmallTitle({super.key, required this.text});
  final String text;
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: Theme.of(context).textTheme.titleLarge?.copyWith(
        fontWeight: FontWeight.w400,
        color: generalTextColor,
      ),
    );
  }
}
