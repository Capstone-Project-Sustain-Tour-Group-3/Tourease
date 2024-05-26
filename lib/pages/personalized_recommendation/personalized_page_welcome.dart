import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:tourease/constants/assets_constant.dart';
import 'package:tourease/constants/color_constant.dart';
import 'package:tourease/controllers/personalized_recommendation_controller.dart';
import 'package:tourease/pages/personalized_recommendation/personalized_widget_button.dart';
import 'package:tourease/pages/personalized_recommendation/personalized_widget_view.dart';

class PersonalizedWelcomePage extends StatelessWidget {
  const PersonalizedWelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        statusBarColor: ColorCollection.transparent,
        statusBarIconBrightness: Brightness.dark,
      ),
    );

    final PersonalizedRecommendationController recommendationController =
        Get.put(PersonalizedRecommendationController());

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
                assets: AssetsCollection.personalizedWelcome,
                title: 'Hi, Agus!',
                subtitle: 'Siap untuk memulai perjalanan mu?',
              ),
            ),
            const Spacer(),
            PersonalizedRecommendationButton(
              navigationType: 'tourOption',
              title: 'Mulai',
              recommendationController: recommendationController,
              isEnabled: true,
              observeSelection: false,
            ),
          ],
        ),
      ),
    );
  }
}
