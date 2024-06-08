import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tourease/constants/color_constant.dart';
import 'package:tourease/constants/status_bar_constant.dart';
import 'package:tourease/constants/text_style_constant.dart';
import 'package:tourease/controllers/personalized_recommendation_controller.dart';
import 'package:tourease/pages/personalized_recommendation/personalized_widget_button.dart';
import 'package:tourease/pages/personalized_recommendation/personalized_widget_tour_option_list_view.dart';

class PersonalizedTourOptionPage extends StatelessWidget {
  const PersonalizedTourOptionPage({super.key});

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
          'Jenis Destinasi',
          style: TextStyleCollection.bodyBold.copyWith(
            color: ColorPrimary.primary900,
          ),
          minFontSize: 16,
          maxFontSize: 18,
          textAlign: TextAlign.center,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 16, left: 16, right: 16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                AutoSizeText(
                  'Pilih jenis tempat yang Anda inginkan dan kami akan memberikan rekomendasi terbaik!',
                  style: TextStyleCollection.bodyMedium.copyWith(
                    color: ColorPrimary.primary900,
                  ),
                  minFontSize: 14,
                  maxFontSize: 16,
                ),
                const SizedBox(
                  height: 24,
                ),
                TourOptionListView(),
              ],
            ),
            Obx(
              () {
                bool isButtonEnabled =
                    recommendationController.isTourOptionSelectionValid();

                return PersonalizedRecommendationButton(
                  navigationType: 'location',
                  title: 'Mulai',
                  recommendationController: recommendationController,
                  isEnabled: isButtonEnabled,
                  observeSelection: true,
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
