import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:tourease/constants/assets_constant.dart';
import 'package:tourease/constants/color_constant.dart';
import 'package:tourease/controllers/splash_controller.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        statusBarColor: ColorCollection.transparent,
        statusBarIconBrightness: Brightness.dark,
      ),
    );

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
