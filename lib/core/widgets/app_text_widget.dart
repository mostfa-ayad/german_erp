// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class AppTextWidget extends StatelessWidget {
  final String text;
  final double fontSize;
  final FontWeight fontWeight;
  const AppTextWidget({
    super.key,
    required this.text,
    this.fontSize = 16,
    this.fontWeight = FontWeight.normal,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(fontSize: fontSize, fontWeight: fontWeight),
    );
  }
}
