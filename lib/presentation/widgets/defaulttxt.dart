import 'package:flutter/material.dart';

// ignore: must_be_immutable
class DefaultText extends StatelessWidget {
  DefaultText({super.key, this.color, required this.text, this.fontSize});
  Color? color;
  String text;
  double? fontSize;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
          fontSize: fontSize, color: color, fontWeight: FontWeight.bold),
    );
  }
}
