import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:german_erp/auth/presentation/widgets/auth_field_widget.dart';
import 'package:german_erp/global/widgets/app_custom_text_widget.dart';

class AuthPage extends StatefulWidget {
  const AuthPage({super.key});

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  bool isLogin = true;
  bool isScure = true;
  TextEditingController email = TextEditingController();

  TextEditingController username = TextEditingController();

  TextEditingController password = TextEditingController();

  TextEditingController repassword = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Padding(
          padding: const EdgeInsets.all(8),
          child: Card(
            child: SizedBox(
                width: (MediaQuery.sizeOf(context).width > 500.h)
                    ? 500.h
                    : MediaQuery.sizeOf(context).width,
                child: Column(
                  children: [
                    Image.asset("assets/images/logo.png"),
                    AppCustomTextWidget(
                        text: (isLogin) ? "login".tr() : "register".tr()),
                    Visibility(
                      visible: !isLogin,
                      child: AuthFieldWidget(
                        prefixIcon: Icons.person,
                        controller: username,
                        hint: "user name".tr(),
                      ),
                    ),
                    AuthFieldWidget(
                        prefixIcon: Icons.email,
                        controller: email,
                        hint: "email".tr()),
                    AuthFieldWidget(
                      prefixIcon: Icons.password,
                      controller: password,
                      hint: "password".tr(),
                      isScure: isScure,
                      suffixIcon: IconButton(
                          onPressed: () {
                            setState(() {
                              setState(() {
                                isScure = !isScure;
                              });
                            });
                          },
                          icon: Icon((isScure)
                              ? Icons.remove_red_eye
                              : Icons.remove_red_eye_outlined)),
                    ),
                    Visibility(
                        visible: !isLogin,
                        child: AuthFieldWidget(
                            isScure: isScure,
                            prefixIcon: Icons.password,
                            controller: repassword,
                            hint: "repassword".tr())),
                    SizedBox(
                      height: 10.h,
                    ),
                    ElevatedButton(
                      onPressed: () {},
                      child: AppCustomTextWidget(
                          text: (isLogin) ? "login".tr() : "register".tr()),
                    ),
                    footer()
                  ],
                )),
          )),
    ));
  }

  Row footer() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        InkWell(
            onTap: () {
              setState(() {
                isLogin = !isLogin;
              });
            },
            child: AppCustomTextWidget(
                text: (isLogin) ? "register_msg".tr() : "login_msg".tr()))
      ],
    );
  }
}
