import 'package:flutter/material.dart';
import 'package:tourease/constants/color_constant.dart';
import 'package:tourease/constants/status_bar_constant.dart';
import 'package:tourease/pages/login/login_back.dart';
import 'package:tourease/pages/login/login_banner.dart';
import 'package:tourease/pages/login/login_button.dart';
import 'package:tourease/pages/login/login_footer.dart';
import 'package:tourease/pages/login/login_form.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    StatusBarConstant.statusBar;

    return Scaffold(
      backgroundColor: ColorNeutral.neutral50,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const LoginBack(),
              const LoginBanner(),
              LoginForm(),
            ],
          ),
          const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              LoginButton(),
              LoginFooter(),
            ],
          ),
        ],
      ),
    );
  }
}
