import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tourease/constants/assets_constant.dart';
import 'package:tourease/constants/color_constant.dart';
import 'package:tourease/constants/status_bar_constant.dart';
import 'package:tourease/constants/text_style_constant.dart';
import 'package:tourease/pages/register/register_button.dart';
import 'package:tourease/pages/register/register_back.dart';

class RegisterSuccessPage extends StatelessWidget {
  const RegisterSuccessPage({super.key});

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
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const SizedBox(height: 24),
                    Text(
                      'Selamat! akunmu sudah berhasil dibuat.',
                      style: TextStyleCollection.bodyBold.copyWith(
                        fontSize: 18,
                        color: ColorNeutral.neutral900,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 91),
                    SvgPicture.asset(
                      AssetsCollection.registerSuccess,
                      height: 131,
                    ),
                    const SizedBox(height: 91),
                    Text(
                      'Siap menjelajahi berbagai fitur menarik dan pengalaman luar biasa yang menantimu? Yuk, ikuti langkah selanjutnya untuk membuka petualanganmu!',
                      style: TextStyleCollection.caption.copyWith(
                        fontSize: 14,
                        color: ColorNeutral.neutral700,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const Spacer(),
                    RegisterButton(text: "Mulai", onPressed: () {})
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
