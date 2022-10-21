import 'package:flutter/material.dart';
import 'package:mynotes/constant/styles.dart';

class CustomText extends StatelessWidget {
  final String text;
  final TextStyle style;
  final TextEditingController controller;
  final dynamic mLine;
  final dynamic mLength;
  const CustomText({
    required this.controller,
    required this.text,
    required this.style,
    this.mLength,
    this.mLine,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
        maxLength: mLength,
        maxLines: mLine,
        controller: controller,
        decoration: InputDecoration(
            border: InputBorder.none,
            hintStyle: TextStyle(color: Styles.kGrey),
            hintText: text),
        style: style);
  }
}
