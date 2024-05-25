import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tourease/constants/color_constant.dart';
import 'package:tourease/controllers/onboarding_controller.dart';

class OnboardingBack extends StatelessWidget {
  const OnboardingBack({super.key});

  @override
  Widget build(BuildContext context) {
    final OnboardingController onboardingController = Get.put(
      OnboardingController(),
    );

    return Positioned(
      top: 40,
      left: 11.5,
      child: Obx(
        () => onboardingController.currentPage.value != 0
            ? IconButton(
                onPressed: () {
                  onboardingController.pageController.previousPage(
                    duration: const Duration(milliseconds: 300),
                    curve: Curves.linear,
                  );
                },
                style: ButtonStyle(
                  overlayColor: WidgetStatePropertyAll(ColorNeutral.neutral100),
                ),
                icon: Icon(
                  Icons.arrow_back,
                  color: ColorPrimary.primary500,
                ),
              )
            : const SizedBox.shrink(),
      ),
    );
  }
}
