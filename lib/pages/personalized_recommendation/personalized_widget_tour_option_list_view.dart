import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';
import 'package:tourease/constants/color_constant.dart';
import 'package:tourease/controllers/personalized_recommendation_controller.dart';
import 'package:tourease/pages/personalized_recommendation/personalized_categories.dart';

class TourOptionListView extends StatelessWidget {
  const TourOptionListView({super.key});

  @override
  Widget build(BuildContext context) {
    final PersonalizedRecommendationController recommendationController =
        Get.put(PersonalizedRecommendationController());

    WidgetsBinding.instance.addPostFrameCallback((_) {
      recommendationController.getCategories();
    });

    return Expanded(
      child: Obx(
        () {
          return ListView.builder(
            shrinkWrap: true,
            itemCount: recommendationController.categories.value.data?.length,
            itemBuilder: (context, index) {
              final category =
                  recommendationController.categories.value.data?[index];
              if (recommendationController.isLoadingCategory.value) {
                return Padding(
                  padding: const EdgeInsets.only(top: 24, left: 24, right: 24),
                  child: Center(
                    child: SizedBox(
                      height: 128,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(12),
                        child: Shimmer.fromColors(
                          baseColor: ColorNeutral.neutral50,
                          highlightColor: ColorNeutral.neutral300,
                          child: Container(
                            color: ColorNeutral.neutral300,
                          ),
                        ),
                      ),
                    ),
                  ),
                );
              } else {
                return Obx(
                  () {
                    return PersonalizedCategories(
                      image: category?.urlVideo ?? '',
                      title: category?.nama ?? '',
                      isSelected:
                          recommendationController.isTourOptionSelected(category?.id ?? ''),
                      onTap: () {
                        recommendationController
                            .toggleTourOptionSelection(category?.id ?? '');
                      },
                    );
                  },
                );
              }
            },
          );
        },
      ),
    );
  }
}
