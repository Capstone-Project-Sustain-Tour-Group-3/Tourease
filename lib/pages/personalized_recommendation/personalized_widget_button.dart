import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tourease/constants/color_constant.dart';
import 'package:tourease/controllers/personalized_recommendation_controller.dart';
import 'package:tourease/widgets/button_widget.dart';

class PersonalizedRecommendationButton extends StatelessWidget {
  final String navigationType;
  final String title;
  final PersonalizedRecommendationController recommendationController;
  final bool isEnabled;
  final bool observeSelection;

  const PersonalizedRecommendationButton({
    super.key,
    required this.navigationType,
    required this.title,
    required this.recommendationController,
    required this.isEnabled,
    this.observeSelection = false,
  });

  @override
  Widget build(BuildContext context) {
    void handleNavigation() {
      if (navigationType == 'tourOption') {
        recommendationController.navigateToTourOptionPage();
      } else if (navigationType == 'location') {
        recommendationController.navigateToLocationPage();
      } else if (navigationType == 'finishPage') {
        recommendationController.navigateToFinishPage();
      }
    }

    Widget buildButton(bool isEnabled) {
      return Padding(
        padding: const EdgeInsets.only(left: 19.5, right: 19.5, bottom: 24.0),
        child: SizedBox(
          width: double.infinity,
          height: 48,
          child: ButtonWidget(
            onPressed: isEnabled ? handleNavigation : null,
            text: title,
            textColor: ColorNeutral.neutral100,
            backgroundColor:
                isEnabled ? ColorPrimary.primary500 : ColorNeutral.neutral300,
          ),
        ),
      );
    }

    if (observeSelection) {
      return Obx(() {
        bool finalIsEnabled = navigationType == 'location'
            ? recommendationController.isTourOptionSelectionValid()
            : recommendationController.isProvinceSelectionValid();
        return buildButton(finalIsEnabled);
      });
    } else {
      return buildButton(isEnabled);
    }
  }
}
