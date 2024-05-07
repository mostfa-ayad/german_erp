// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class DeleteAlertDialog extends StatelessWidget {
  final String title;
  void Function() onPressed;
  DeleteAlertDialog({
    super.key,
    this.title = "Are you sure",
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(title),
      actions: [
        ElevatedButton(
            onPressed: () {
              onPressed();
              Navigator.pop(context);
            },
            child: const Text("Ok")),
        ElevatedButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Text("close")),
      ],
    );
  }
}
