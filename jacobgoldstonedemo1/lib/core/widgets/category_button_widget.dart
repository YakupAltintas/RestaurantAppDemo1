import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CategoryButton extends StatelessWidget {
  CategoryButton({
    super.key,
    required this.onTap,
    required this.text,
    required this.textColor,
    required this.backgroundColor,
  });
  final String text;
  final Color textColor;
  final Color backgroundColor;
  late void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.only(right: 10),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5), color: backgroundColor),
            
        padding: const EdgeInsets.all(5),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const CircleAvatar(
                radius: 20,
                backgroundImage: NetworkImage("https://picsum.photos/200")),
            Text(text, style: TextStyle(color: textColor))
          ],
        ),
      ),
    );
  }
}
