import 'package:flutter/material.dart';
import 'package:tourease/constants/color_constant.dart';
import 'package:tourease/constants/text_style_constant.dart';

class VerificationOtpBanner extends StatelessWidget {
  const VerificationOtpBanner({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 44),
          Text(
            'Masukkan Kode Verifikasi',
            style: TextStyleCollection.bodyBold.copyWith(
              fontSize: 16,
              color: ColorNeutral.neutral900,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            'Masukkan 4 digit kode unik yang kami berikan kepada anda di bawah ini.',
            style: TextStyleCollection.caption.copyWith(
              fontSize: 14,
              color: ColorNeutral.neutral700,
            ),
          ),
          const SizedBox(height: 60),
        ],
      ),
    );
  }
}
