import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tourease/constants/assets_constant.dart';
import 'package:tourease/constants/color_constant.dart';
import 'package:tourease/constants/text_style_constant.dart';
import 'package:tourease/pages/register/register_back.dart';

class RegisterFailedPage extends StatelessWidget {
  const RegisterFailedPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorNeutral.neutral50,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const RegisterBack(addSpace: false),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const SizedBox(height: 24),
                    Text(
                      'Maaf, pembuatan akun gagal.',
                      style: TextStyleCollection.bodyBold.copyWith(
                        fontSize: 18,
                        color: ColorNeutral.neutral900,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 91),
                    SvgPicture.asset(
                      AssetsCollection.registerFailed,
                      height: 217,
                    ),
                    const SizedBox(height: 60),
                    Text(
                      'Kode OTP yang Anda masukkan tidak valid. Silakan periksa kembali dan masukkan kode yang benar.',
                      style: TextStyleCollection.caption.copyWith(
                        fontSize: 14,
                        color: ColorNeutral.neutral700,
                      ),
                      textAlign: TextAlign.center,
                    ),
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
