import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tourease/constants/color_constant.dart';
import 'package:tourease/constants/status_bar_constant.dart';
import 'package:tourease/constants/text_style_constant.dart';
import 'package:tourease/controllers/personalized_recommendation_controller.dart';
import 'package:tourease/pages/personalized_recommendation/personalized_widget_location_grid_view.dart';
import 'package:tourease/pages/personalized_recommendation/personalized_widget_button.dart';

class PersonalizedLocationPage extends StatelessWidget {
  const PersonalizedLocationPage({super.key});

  @override
  Widget build(BuildContext context) {
    StatusBarConstant.statusBar;

    final PersonalizedRecommendationController recommendationController =
        Get.find<PersonalizedRecommendationController>();

    return Scaffold(
      backgroundColor: ColorNeutral.neutral50,
      appBar: AppBar(
        backgroundColor: ColorNeutral.neutral50,
        surfaceTintColor: ColorNeutral.neutral50,
        centerTitle: true,
        title: AutoSizeText(
          'Lokasi Favoritmu',
          style: TextStyleCollection.bodyBold.copyWith(
            color: ColorPrimary.primary900,
          ),
          minFontSize: 16,
          maxFontSize: 18,
          textAlign: TextAlign.center,
        ),
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: Icon(
            Icons.arrow_back,
            color: ColorPrimary.primary500,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(
          top: 16,
          left: 16,
          right: 16,
        ),
        child: Column(
          children: [
            AutoSizeText(
              'Pilih 3 provinsi yang ingin kamu kunjungi. Ini akan membantu kami memberikan rekomendasi tempat wisata yang sesuai dengan preferensimu!',
              style: TextStyleCollection.bodyMedium.copyWith(
                color: ColorPrimary.primary900,
              ),
              minFontSize: 14,
              maxFontSize: 16,
            ),
            const SizedBox(
              height: 24,
            ),
            const Expanded(
              child: LocationGridView(),
            ),
            Obx(
              () {
                bool isButtonEnabled =
                    recommendationController.isProvinceSelectionValid();

                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 24),
                  child: PersonalizedRecommendationButton(
                    navigationType: 'finishPage',
                    title: 'Mulai',
                    recommendationController: recommendationController,
                    isEnabled: isButtonEnabled,
                    observeSelection: true,
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
