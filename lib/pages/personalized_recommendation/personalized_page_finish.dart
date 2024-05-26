import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:tourease/constants/assets_constant.dart';
import 'package:tourease/constants/color_constant.dart';
import 'package:tourease/controllers/personalized_recommendation_controller.dart';
import 'package:tourease/pages/personalized_recommendation/personalized_widget_button.dart';
import 'package:tourease/pages/personalized_recommendation/personalized_widget_view.dart';

class PersonalizedFinishPage extends StatelessWidget {
  const PersonalizedFinishPage({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        statusBarColor: ColorCollection.transparent,
        statusBarIconBrightness: Brightness.dark,
      ),
    );

    //
    final PersonalizedRecommendationController recommendationController =
        Get.find<PersonalizedRecommendationController>();

    print(
        "Is tour option selection valid: ${recommendationController.isProvinceSelectionValid()}");

    return Scaffold(
      backgroundColor: ColorNeutral.neutral50,
      body: Padding(
        padding: const EdgeInsets.only(top: 16, left: 16, right: 16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Spacer(),
            Center(
              child: PersonalizedRecommendationViewWidget(
                assets: AssetsCollection.personalizedFinish,
                title: 'Selamat!',
                subtitle: 'Terimakasih telah mengatur personalisasimu!',
              ),
            ),
            const Spacer(),
            Obx(() {
              bool isButtonEnabled =
                  recommendationController.isTourOptionSelectionValid() &&
                      recommendationController.isProvinceSelectionValid();

              return PersonalizedRecommendationButton(
                navigationType: 'finishPage',
                title: 'Mulai Telusuri',
                recommendationController: recommendationController,
                isEnabled: isButtonEnabled,
                observeSelection: false,
              );
            }),
          ],
        ),
      ),
    );
  }
}
