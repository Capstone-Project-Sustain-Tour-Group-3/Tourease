import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tourease/constants/color_constant.dart';
import 'package:tourease/controllers/onboarding_controller.dart';
import 'package:tourease/pages/onboarding/onboarding_login_register_page.dart';
import 'package:tourease/widgets/button_widget.dart';

class OnboardingButton extends StatelessWidget {
  const OnboardingButton({super.key});

  @override
  Widget build(BuildContext context) {
    final OnboardingController onboardingController = Get.put(
      OnboardingController(),
    );

    return Obx(
      () => onboardingController.currentPage.value == 2
          ? Positioned(
              bottom: 24,
              left: 19.5,
              right: 19.5,
              child: SizedBox(
                width: double.infinity,
                height: 48,
                child: ButtonWidget(
                  onPressed: () {
                    Get.to(
                      () => const OnboardingLoginRegisterPage(),
                    );
                  },
                  text: 'Mulai',
                  textColor: ColorNeutral.neutral100,
                ),
              ),
            )
          : const SizedBox.shrink(),
    );
  }
}
