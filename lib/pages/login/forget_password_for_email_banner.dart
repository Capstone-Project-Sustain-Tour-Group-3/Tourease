import 'package:flutter/material.dart';
import 'package:tourease/constants/color_constant.dart';
import 'package:tourease/constants/text_style_constant.dart';

class ForgetPasswordForEmailBanner extends StatelessWidget {
  const ForgetPasswordForEmailBanner({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 44),
        Padding(
          padding: const EdgeInsets.only(left: 16, right: 16, bottom: 8),
          child: Text(
            'Pemulihan Akun',
            style: TextStyleCollection.bodyBold.copyWith(
              fontSize: 16,
              color: ColorNeutral.neutral900,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 16, right: 16, bottom: 24),
          child: Text(
            'Cukup masukkan alamat email yang terdaftar di akun Anda, dan kami akan mengirimkan kode verifikasi ke email Anda. Gunakan kode tersebut untuk mengatur ulang kata sandi Anda dengan mudah.',
            style: TextStyleCollection.caption.copyWith(
              fontSize: 14,
              color: ColorNeutral.neutral700,
            ),
          ),
        ),
      ],
    );
  }
}
