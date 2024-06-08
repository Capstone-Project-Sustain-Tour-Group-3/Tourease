import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tourease/constants/color_constant.dart';
import 'package:tourease/constants/text_style_constant.dart';
import 'package:tourease/controllers/login_controller.dart';

class VerificationOtpResendCode extends StatelessWidget {
   VerificationOtpResendCode({super.key});
  final LoginController forgetPasswordController = Get.put(
    LoginController(),
  );

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Tidak menerima kodenya? ',
            style: TextStyleCollection.caption
                .copyWith(fontSize: 12, color: ColorNeutral.neutral700),
          ),
          GestureDetector(
            child: Text(
              'Kirim ulang kode ',
              style: TextStyleCollection.caption
                  .copyWith(fontSize: 12, color: ColorNeutral.neutral700),
            ),
            onTap: () => forgetPasswordController.resendOtp(),
          )
        ],
      ),
    );
  }
}
