import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:get/get.dart';
import 'package:tourease/constants/color_constant.dart';
import 'package:tourease/constants/status_bar_constant.dart';
import 'package:tourease/constants/text_style_constant.dart';
import 'package:tourease/pages/register/register_button.dart';
import 'package:tourease/pages/register/register_back.dart';
import 'package:tourease/pages/register/register_success_page.dart';

class RegisterOtpPage extends StatelessWidget {
  const RegisterOtpPage({super.key});

  @override
  Widget build(BuildContext context) {
    StatusBarConstant.statusBar;

    return Scaffold(
      backgroundColor: ColorNeutral.neutral50,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const RegisterBack(addSpace: false),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 24),
                    Text(
                      'Masukkan Kode Verifikasi',
                      style: TextStyleCollection.bodyBold.copyWith(
                        fontSize: 18,
                        color: ColorNeutral.neutral900,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      'Masukkan 4 digit kode unik yang kami berikan kepada anda di bawah ini.',
                      style: TextStyleCollection.caption.copyWith(
                        color: ColorNeutral.neutral700,
                      ),
                    ),
                    const SizedBox(height: 40),
                    OtpTextField(
                      cursorColor: ColorNeutral.neutral900,
                      numberOfFields: 4,
                      keyboardType: TextInputType.number,
                      textStyle: TextStyleCollection.bodyMedium.copyWith(
                        color: ColorNeutral.neutral900,
                        fontSize: 16,
                      ),
                      enabledBorderColor: ColorNeutral.neutral900,
                      focusedBorderColor: ColorNeutral.neutral900,
                      showFieldAsBox: false,
                      fieldWidth: 28,
                      margin: const EdgeInsets.symmetric(horizontal: 8.0),
                      onCodeChanged: (String code) {},
                    ),
                    const SizedBox(height: 24),
                    Center(
                      child: Text.rich(
                        TextSpan(
                          text: 'Tidak menerima kodenya? ',
                          style: TextStyleCollection.caption.copyWith(
                            color: ColorNeutral.neutral700,
                          ),
                          children: [
                            TextSpan(
                              text: 'Kirim ulang kode',
                              style: TextStyleCollection.caption.copyWith(
                                color: ColorPrimary.primary500,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const Spacer(),
                    RegisterButton(
                      text: "Kirim",
                      onPressed: () {
                        Get.to(() => const RegisterSuccessPage());
                      },
                    ),
                    const SizedBox(
                      height: 5,
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
