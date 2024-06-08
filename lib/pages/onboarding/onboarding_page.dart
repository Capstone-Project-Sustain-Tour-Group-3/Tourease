import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:tourease/constants/assets_constant.dart';
import 'package:tourease/constants/color_constant.dart';
import 'package:tourease/constants/status_bar_constant.dart';
import 'package:tourease/controllers/onboarding_controller.dart';
import 'package:tourease/pages/onboarding/onboarding_back.dart';
import 'package:tourease/pages/onboarding/onboarding_button.dart';
import 'package:tourease/pages/onboarding/onboarding_skip.dart';
import 'package:tourease/pages/onboarding/onboarding_view_widget.dart';

class OnboardingPage extends StatelessWidget {
  const OnboardingPage({super.key});

  @override
  Widget build(BuildContext context) {
    StatusBarConstant.statusBar;

    final OnboardingController onboardingController = Get.put(
      OnboardingController(),
    );

    return Scaffold(
      backgroundColor: ColorNeutral.neutral50,
      body: Stack(
        children: [
          PageView(
            controller: onboardingController.pageController,
            onPageChanged: (index) {
              onboardingController.onPageChanged(index);
            },
            children: [
              OnboardingViewWidget(
                assets: AssetsCollection.onboarding1,
                title: 'Temukan Destinasi Impianmu!',
                subtitle:
                    'Jelajahi destinasi wisata tersembunyi di indonesia, temukan tempat-tempat yang belum pernah kamu bayangkan sebelumnya.',
              ),
              OnboardingViewWidget(
                assets: AssetsCollection.onboarding2,
                title: 'Rencanakan Rute Terbaik!',
                subtitle:
                    'AI Assistant kami akan membantumu menemukan rute perjalanan yang paling sesuai dengan minat dan kebutuhanmu.',
              ),
              OnboardingViewWidget(
                assets: AssetsCollection.onboarding3,
                title: 'Rasakan Pengalaman Tak Terlupakan!',
                subtitle:
                    'Dapatkan panduan budaya lokal yang autentik, tonton video conten menarik, dan ciptakan kenangan indah yang tak terlupakan di setiap destinasi.',
              ),
            ],
          ),
          const OnboardingSkip(),
          const OnboardingBack(),
          Container(
            alignment: const Alignment(0, 0.5),
            child: SmoothPageIndicator(
              controller: onboardingController.pageController,
              count: 3,
              effect: ExpandingDotsEffect(
                dotHeight: 8,
                dotWidth: 8,
                dotColor: ColorNeutral.neutral200,
                activeDotColor: ColorSecondary.secondary500,
              ),
            ),
          ),
          const OnboardingButton()
        ],
      ),
    );
  }
}
