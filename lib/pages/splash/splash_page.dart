import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tourease/constants/assets_constant.dart';
import 'package:tourease/constants/color_constant.dart';
import 'package:tourease/constants/status_bar_constant.dart';
import 'package:tourease/controllers/splash_controller.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    StatusBarConstant.statusBar;

    Get.put(
      SplashController(),
    );

    return Scaffold(
      backgroundColor: ColorNeutral.neutral50,
      body: Center(
        child: Image.asset(
          AssetsCollection.splash,
          width: 200,
          height: 200,
        ),
      ),
    );
  }
}
