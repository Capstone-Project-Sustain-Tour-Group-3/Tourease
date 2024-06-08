import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tourease/constants/color_constant.dart';
import 'package:tourease/controllers/login_controller.dart';
import 'package:tourease/widgets/button_widget.dart';

class ForgetPasswordForEmailButton extends StatelessWidget {
   ForgetPasswordForEmailButton({super.key});

final LoginController forgetPasswordController = Get.put(
    LoginController(),
  );

 @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: SizedBox(
        width: double.infinity,
        height: 48,
        child: ButtonWidget(
          onPressed: () {
            forgetPasswordController.resendOtp();
          },
          text: 'Lanjut',
          textColor: ColorNeutral.neutral100,
        ),
      ),
    );
  }
}