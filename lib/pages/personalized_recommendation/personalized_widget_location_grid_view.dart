import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';
import 'package:tourease/constants/color_constant.dart';
import 'package:tourease/controllers/personalized_recommendation_controller.dart';
import 'package:tourease/pages/personalized_recommendation/personalized_provinces.dart';

class LocationGridView extends StatelessWidget {
  const LocationGridView({super.key});

  @override
  Widget build(BuildContext context) {
    final PersonalizedRecommendationController recommendationController =
        Get.put(PersonalizedRecommendationController());

    WidgetsBinding.instance.addPostFrameCallback((_) {
      recommendationController.getProvinces();
    });

    return Expanded(
      child: Obx(
        () {
          return GridView.builder(
            shrinkWrap: true,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              // crossAxisSpacing: 2,
              // mainAxisSpacing: 2,
              childAspectRatio: 16/9, // 4.5/2
            ),
            itemCount: recommendationController.provinces.value.data?.length,
            itemBuilder: (context, index) {
              final province =
                  recommendationController.provinces.value.data?[index];
              if (recommendationController.isLoadingCategory.value) {
                return SizedBox(
                  height: 86,
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
                );
              } else {
                return Obx(
                  () {
                    return PersonalizedProvinces(
                      image: province?.url ?? '',
                      title: province?.nama ?? '',
                      isSelected: recommendationController
                          .isProvinceSelected(province?.id ?? ''),
                      onTap: () => recommendationController
                          .toggleProvinceSelection(province?.id ?? ''),
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
