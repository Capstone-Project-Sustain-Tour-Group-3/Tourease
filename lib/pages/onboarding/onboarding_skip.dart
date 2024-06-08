import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tourease/constants/color_constant.dart';
import 'package:tourease/constants/text_style_constant.dart';
import 'package:tourease/controllers/onboarding_controller.dart';

class OnboardingSkip extends StatelessWidget {
  const OnboardingSkip({super.key});

  @override
  Widget build(BuildContext context) {
    final OnboardingController onboardingController = Get.put(
      OnboardingController(),
    );

    return Positioned(
      top: 40,
      right: 27.5,
      child: Obx(
        () => onboardingController.currentPage.value != 2
            ? TextButton(
                onPressed: () {
                  onboardingController.pageController.jumpToPage(2);
                },
                style: ButtonStyle(
                  overlayColor: WidgetStatePropertyAll(ColorNeutral.neutral100),
                ),
                child: AutoSizeText(
                  'Skip',
                  style: TextStyleCollection.bodyMedium.copyWith(
                    color: ColorPrimary.primary500,
                  ),
                  minFontSize: 16,
                  maxFontSize: 18,
                  textAlign: TextAlign.center,
                ),
              )
            : const SizedBox.shrink(),
      ),
    );
  }
}
