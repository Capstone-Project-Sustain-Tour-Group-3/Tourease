import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:tourease/constants/assets_constant.dart';
import 'package:tourease/constants/color_constant.dart';
import 'package:tourease/constants/text_style_constant.dart';

class DestinasiZeroResult extends StatelessWidget {
  const DestinasiZeroResult({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SvgPicture.asset(
              AssetsCollection.registerFailed,
            ),
            const SizedBox(
              height: 31,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Column(
                children: [
                  AutoSizeText(
                    'Oops, belum ada hasil nih!',
                    style: TextStyleCollection.bodyBold.copyWith(
                      color: ColorPrimary.primary900,
                    ),
                    minFontSize: 16,
                    maxFontSize: 18,
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  AutoSizeText(
                    'Coba deh ketik kata kunci lain atau periksa lagi ejaannya. Kami yakin kamu akan menemukan yang kamu cari!',
                    style: TextStyleCollection.caption.copyWith(
                      color: ColorPrimary.primary900,
                    ),
                    minFontSize: 14,
                    maxFontSize: 16,
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(
                    height: 24,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
