import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tourease/constants/color_constant.dart';
import 'package:tourease/constants/status_bar_constant.dart';
import 'package:tourease/constants/text_style_constant.dart';
import 'package:tourease/pages/register/register_button.dart';
import 'package:tourease/pages/register/register_otp_page.dart';
import 'package:tourease/pages/register/register_back.dart';

class RegisterVerificationPage extends StatelessWidget {
  final String email;

  const RegisterVerificationPage({super.key, required this.email});

  @override
  Widget build(BuildContext context) {
    StatusBarConstant.statusBar;

    return Scaffold(
      backgroundColor: ColorNeutral.neutral50,
      body: Stack(
        children: [
          const RegisterBack(addSpace: true),
          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 100),
                Text(
                  'Verifikasi Email anda',
                  style: TextStyleCollection.bodyBold.copyWith(
                    fontSize: 18,
                    color: ColorNeutral.neutral900,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  'Kode verifikasi akan kami kirimkan ke alamat Email $email. Pastikan Emailmu aktif agar kamu segera menerima kode verifikasinya.',
                  style: TextStyleCollection.caption.copyWith(
                    color: ColorNeutral.neutral700,
                  ),
                ),
                const Spacer(),
                RegisterButton(
                  onPressed: () {
                    Get.to(() => const RegisterOtpPage());
                  },
                  text: 'Verifikasi',
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
