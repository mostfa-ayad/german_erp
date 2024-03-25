// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class AppTextFieldWidget extends StatelessWidget {
  TextEditingController controller;
  String label;
  bool enabled;
  AppTextFieldWidget({
    super.key,
    required this.controller,
    required this.label,
    this.enabled = true,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      enabled: enabled,
      decoration: InputDecoration(label: Text(label)),
    );
  }
}
