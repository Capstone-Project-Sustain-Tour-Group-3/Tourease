import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tourease/constants/color_constant.dart';
import 'package:tourease/pages/bottom_navbar/bottom_navbar.dart';
import 'package:tourease/pages/login/login_success_banner.dart';

class LoginSuccessPage extends StatelessWidget {
  const LoginSuccessPage({super.key});

  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(seconds: 2), () {
      Get.offAll(
        () => const BottomNavbar(
          initialIndex: 1,
        ),
      );
    });
    return Scaffold(
        backgroundColor: ColorNeutral.neutral50,
        body: const LoginSuccessBanner());
  }
}
