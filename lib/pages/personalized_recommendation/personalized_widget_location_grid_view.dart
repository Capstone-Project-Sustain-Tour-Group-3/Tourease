import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tourease/constants/color_constant.dart';
import 'package:tourease/constants/text_style_constant.dart';
import 'package:tourease/controllers/personalized_recommendation_controller.dart';
import 'package:tourease/pages/personalized_recommendation/dummy_data.dart';

class LocationGridView extends StatelessWidget {
  const LocationGridView({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, String>> tourOptions = DummyData.tourOptions;
    final List<String> provinceNames = DummyData.provinceNames;
    
    final PersonalizedRecommendationController recommendationController =
        Get.find();

    return GridView.builder(
      shrinkWrap: true,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        // crossAxisSpacing: 24,
        mainAxisSpacing: 16,
        childAspectRatio: 4 / 2, // 4.5/2
      ),
      itemCount: provinceNames.length,
      itemBuilder: (context, index) {
        return Obx(
          () {
            return LocationTile(
              image: tourOptions[index % tourOptions.length]['image']!,
              title: provinceNames[index],
              isSelected: recommendationController.isProvinceSelected(index),
              onTap: () =>
                  recommendationController.toggleProvinceSelection(index),
            );
          },
        );
      },
    );
  }
}

class LocationTile extends StatelessWidget {
  final String image;
  final String title;
  final bool isSelected;
  final VoidCallback onTap;

  const LocationTile({
    super.key,
    required this.image,
    required this.title,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Center(
        child: SizedBox(
          height: 86,
          child: Stack(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Stack(
                  children: [
                    Image.asset(
                      image,
                      width: 144, //double.infinity
                      height: 86,
                      fit: BoxFit.cover,
                    ),
                    if (isSelected)
                      Container(
                        width: 144,
                        height: 86,
                        color: Colors.black.withOpacity(0.5),
                      )
                  ],
                ),
              ),
              Positioned(
                bottom: 8,
                left: 8,
                child: AutoSizeText(
                  title,
                  style: TextStyleCollection.bodyMedium.copyWith(
                    color: ColorNeutral.neutral50,
                  ),
                  textAlign: TextAlign.left,
                  minFontSize: 12,
                  maxFontSize: 14,
                ),
              ),
              if (isSelected)
                Positioned(
                  top: 8,
                  right: 8,
                  child: Icon(
                    Icons.check_circle,
                    color: ColorNeutral.neutral50,
                    size: 24,
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
