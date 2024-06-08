import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:get/get.dart';
import 'package:tourease/constants/text_style_constant.dart';

import '../../controllers/login_controller.dart';

class VerificationOtpForm extends StatelessWidget {
  VerificationOtpForm({super.key});

  final LoginController verifyController = Get.put(
    LoginController(),
  );

  @override
  Widget build(BuildContext context) {
    return OtpTextField(
      numberOfFields: 4,
      fieldWidth: 32,
      borderWidth: 2.0,
      enabledBorderColor: const Color(0xFF474646),
      focusedBorderColor: const Color(0xFF474646),
      cursorColor: const Color(0xFF474646),
      keyboardType: TextInputType.number,
      onSubmit: (String otp) {
        verifyController.otp.value = otp;
      },
      styles: List.generate(
          4, (index) => TextStyleCollection.bodyMedium.copyWith(fontSize: 16)),
    );
  }
}
