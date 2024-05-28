import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tourease/constants/color_constant.dart';
import 'package:tourease/widgets/button_widget.dart';

import '../../controllers/login_controller.dart';

class VerificationOtpButtonSend extends StatelessWidget {
   VerificationOtpButtonSend({super.key});

 final LoginController verifyController = Get.put(
    LoginController(),
  );

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16,vertical: 24),
      child: SizedBox(
        width: double.infinity,
        height: 48,
        child: ButtonWidget(
          onPressed: () {
            verifyController.verifyOtp();
          },
          text: 'Kirim',
          textColor: ColorNeutral.neutral100,
        ),
      ),
    );
  }
}
