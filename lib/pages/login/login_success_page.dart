import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tourease/constants/color_constant.dart';
import 'package:tourease/pages/login/login_success_banner.dart';

import '../home/home_page.dart';

class LoginSuccessPage extends StatelessWidget {
  const LoginSuccessPage({super.key});

  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(seconds: 3), () {
      Get.offAll(() => const HomePage());
    });
    return Scaffold(
        backgroundColor: ColorNeutral.neutral50,
        body: const LoginSuccessBanner());
  }
}
