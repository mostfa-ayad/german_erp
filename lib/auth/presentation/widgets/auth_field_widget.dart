// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class AuthFieldWidget extends StatelessWidget {
  TextEditingController controller;
  IconData prefixIcon;
  Widget? suffixIcon;
  String hint;
  bool isScure;
  AuthFieldWidget({
    super.key,
    required this.controller,
    required this.prefixIcon,
    this.suffixIcon,
    required this.hint,
    this.isScure = false,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0),
      child: TextFormField(
        obscureText: isScure,
        controller: controller,
        decoration: InputDecoration(
            prefixIcon: Icon(prefixIcon),
            suffixIcon: suffixIcon,
            hintText: hint,
            border: const OutlineInputBorder()),
      ),
    );
  }
}
