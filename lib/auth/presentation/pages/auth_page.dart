import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AuthPage extends StatelessWidget {
  const AuthPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Padding(
          padding: const EdgeInsets.all(8),
          child: Card(
            child: SizedBox(
                width: (MediaQuery.sizeOf(context).width > 500.h)
                    ? 500
                    : MediaQuery.sizeOf(context).width,
                child: Column(
                  children: [Image.asset("assets/images/logo.png")],
                )),
          )),
    ));
  }
}
