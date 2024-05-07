// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class NavigatorWidget extends StatelessWidget {
  String title;
  Widget screen;
  NavigatorWidget({
    super.key,
    required this.title,
    required this.screen,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: () => Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => screen,
            )),
        child: SizedBox(
          height: 50,
          width: 150,
          child: Card(
              child: Row(children: [
            const Icon(
              Icons.add_card_rounded,
            ),
            Text(title),
          ])),
        ));
  }
}
