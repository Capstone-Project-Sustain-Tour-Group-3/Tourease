import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tourease/constants/color_constant.dart';
import 'package:tourease/constants/text_style_constant.dart';
import 'package:tourease/controllers/bottom_navbar_controller.dart';
import 'package:tourease/pages/bottom_navbar/bottom_navbar.dart';

class HomeCardDestinasiLainnya extends StatelessWidget {
  const HomeCardDestinasiLainnya({super.key});

  @override
  Widget build(BuildContext context) {
    final BottomNavbarController bottomNavbarController = Get.put(
      BottomNavbarController(),
    );

    return Container(
      width: 135,
      margin: const EdgeInsets.symmetric(vertical: 4),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        gradient: LinearGradient(
          stops: const [0.3, 0.5, 0.7, 0.9, 1],
          colors: [
            ColorNeutral.neutral50,
            ColorNeutral.neutral100,
            ColorPrimary.primary100,
            ColorPrimary.primary200,
            ColorPrimary.primary300,
          ],
        ),
      ),
      child: GestureDetector(
        onTap: () {
          Get.to(
            () => const BottomNavbar(
              initialIndex: 1,
            ),
          );
          bottomNavbarController.getInitialIndex(index: 1);
        },
        child: Card(
          color: ColorCollection.transparent,
          shadowColor: ColorCollection.transparent,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          child: Center(
            child: AutoSizeText(
              'Lihat Lainnya',
              style: TextStyleCollection.captionBold.copyWith(
                color: ColorNeutral.neutral700,
              ),
              minFontSize: 14,
              maxFontSize: 16,
            ),
          ),
        ),
      ),
    );
  }
}
