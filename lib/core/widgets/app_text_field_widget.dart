// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class AppTextFieldWidget extends StatelessWidget {
  final TextEditingController controller;
  final String label;
  final bool enabled;
  final int lines;
  final bool required;
  final TextInputType? keyboardType;

  const AppTextFieldWidget(
      {super.key,
      required this.controller,
      required this.label,
      this.enabled = true,
      this.required = false,
      this.keyboardType = TextInputType.text,
      this.lines = 1});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: keyboardType,
      validator: (value) {
        if (required) {
          if (value == null || value.isEmpty) {
            return 'Please enter some text';
          }
        }
        return null;
      },
      maxLines: lines,
      controller: controller,
      enabled: enabled,
      decoration: InputDecoration(label: Text(label)),
    );
  }
}
