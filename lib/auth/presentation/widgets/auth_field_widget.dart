// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class AuthFieldWidget extends StatelessWidget {
  TextEditingController controller;
  String hint;
  AuthFieldWidget({
    super.key,
    required this.controller,
    required this.hint,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0),
      child: TextFormField(
        controller: controller,
        decoration:
            InputDecoration(hintText: hint, border: const OutlineInputBorder()),
      ),
    );
  }
}
