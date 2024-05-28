import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:tourease/constants/assets_constant.dart';
import 'package:tourease/constants/color_constant.dart';
import 'package:tourease/constants/text_style_constant.dart';

class LoginSuccessBanner extends StatelessWidget {
  const LoginSuccessBanner({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 44),
        Center(
          child: Text(
            'Selamat Datang Kembali!',
            style: TextStyleCollection.bodyBold.copyWith(
              fontSize: 16,
              color: ColorNeutral.neutral900,
            ),
          ),
        ),
        Container(
          margin: const EdgeInsets.all(16),
          height: 298,
          width: 328,
          child: SvgPicture.asset(
            AssetsCollection.loginSuccess,
            height: 232,
            width: 129.34,
          ),
        ),
        Container(
          margin: const EdgeInsets.only(right: 32, left: 32, top: 16),
          height: 60,
          width: 328,
          child: Center(
            child: Text(
              'Silakan jelajahi halaman home dan temukan apa yang Anda cari.',
              textAlign: TextAlign.center,
              style: TextStyleCollection.caption.copyWith(
                fontSize: 14,
                color: ColorNeutral.neutral700,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
