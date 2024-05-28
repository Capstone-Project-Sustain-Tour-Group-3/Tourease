import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tourease/constants/color_constant.dart';
import 'package:tourease/constants/status_bar_constant.dart';
import 'package:tourease/pages/login/verification_otp_back.dart';
import 'package:tourease/pages/login/verification_otp_banner.dart';
import 'package:tourease/pages/login/verification_otp_button_send.dart';
import 'package:tourease/pages/login/verification_otp_form.dart';
import 'package:tourease/pages/login/verification_otp_resend_code.dart';

import '../../controllers/login_controller.dart';

class VerificationOtpPage extends StatelessWidget {
  VerificationOtpPage({super.key});

  final LoginController verifyController = Get.put(
    LoginController(),
  );

  @override
  Widget build(BuildContext context) {
    StatusBarConstant.statusBar;
    return Scaffold(
        backgroundColor: ColorNeutral.neutral50,
        body: Stack(
          children: [
            SingleChildScrollView(
              child: ConstrainedBox(
                constraints: BoxConstraints(
                  minHeight: MediaQuery.of(context).size.height,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const VerificationOtpBack(),
                        const VerificationOtpBanner(),
                        VerificationOtpForm(),
                        VerificationOtpResendCode(),
                      ],
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        VerificationOtpButtonSend(),
                      ],
                    )
                  ],
                ),
              ),
            ),
            Obx(() {
              if (verifyController.isLoadingVerify.value) {
                return Container(
                  color: ColorNeutral.neutral900.withOpacity(0.5),
                  child: Center(
                    child: CircularProgressIndicator(
                      valueColor: AlwaysStoppedAnimation<Color>(
                        ColorPrimary.primary500,
                      ),
                    ),
                  ),
                );
              } else {
                return const SizedBox.shrink();
              }
            }),
          ],
        ));
  }
}
