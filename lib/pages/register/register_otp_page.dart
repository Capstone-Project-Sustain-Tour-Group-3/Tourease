import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:get/get.dart';
import 'package:tourease/constants/color_constant.dart';
import 'package:tourease/constants/status_bar_constant.dart';
import 'package:tourease/constants/text_style_constant.dart';
import 'package:tourease/pages/register/register_button.dart';
import 'package:tourease/pages/register/register_back.dart';
import 'package:tourease/pages/register/register_success_page.dart';
import 'package:tourease/pages/register/register_failed_page.dart';
import 'package:tourease/controllers/register_controller.dart';
import 'package:tourease/services/auth_service.dart';

class RegisterOtpPage extends StatelessWidget {
  final String referenceId;
  final String email;

  const RegisterOtpPage({
    Key? key,
    required this.referenceId,
    required this.email,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    StatusBarConstant.statusBar;
    final RegisterController registerController = Get.put(RegisterController());

    registerController.referenceId.value = referenceId;

    return Scaffold(
      backgroundColor: ColorNeutral.neutral50,
      body: Stack(
        children: [
          SafeArea(
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
                          onSubmit: (String otp) {
                            registerController.otp.value = otp;
                          },
                        ),
                        const SizedBox(height: 24),
                        Center(
                          child: Obx(() {
                            if (registerController.isWaitingForOtp.value) {
                              return Text(
                                'Kode OTP telah dikirim (${registerController.start.value})',
                                style: TextStyleCollection.caption.copyWith(
                                  color: ColorNeutral.neutral700,
                                ),
                              );
                            } else {
                              return registerController.isResendingOtp.value
                                  ? CircularProgressIndicator(
                                      color: ColorPrimary.primary500,
                                    )
                                  : Text.rich(
                                      TextSpan(
                                        text: 'Tidak menerima kodenya? ',
                                        style: TextStyleCollection.caption
                                            .copyWith(
                                          color: ColorNeutral.neutral700,
                                        ),
                                        children: [
                                          WidgetSpan(
                                            child: InkWell(
                                              onTap: () {
                                                registerController
                                                    .resendOtp(email);
                                              },
                                              child: Text(
                                                'Kirim ulang kode',
                                                style: TextStyleCollection
                                                    .caption
                                                    .copyWith(
                                                  color:
                                                      ColorPrimary.primary500,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    );
                            }
                          }),
                        ),
                        const Spacer(),
                        RegisterButton(
                          text: "Kirim",
                          onPressed: () async {
                            registerController.isLoading.value = true;
                            try {
                              await AuthService().verifyOtp(
                                  registerController.referenceId.value,
                                  registerController.otp.value);
                              Get.to(() => const RegisterSuccessPage());
                            } catch (e) {
                              Get.to(() => const RegisterFailedPage());
                            } finally {
                              registerController.isLoading.value = false;
                            }
                          },
                        ),
                        const SizedBox(height: 5),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
