import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:tourease/constants/color_constant.dart';
import 'package:tourease/constants/text_style_constant.dart';

class PersonalizedRecommendationViewWidget extends StatelessWidget {
  const PersonalizedRecommendationViewWidget({
    super.key,
    required this.assets,
    required this.title,
    required this.subtitle,
    this.height,
  });

  final String assets;
  final String title;
  final String subtitle;
  final double? height;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Stack(children: [
            SvgPicture.asset(
              assets,
              height: height ?? 214,
            ),
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: AutoSizeText(
                title,
                style: TextStyleCollection.bodyBold.copyWith(
                  color: ColorPrimary.primary900,
                ),
                minFontSize: 16,
                maxFontSize: 18,
                textAlign: TextAlign.center,
              ),
            ),
          ]),
          const SizedBox(
            height: 16,
          ),
          AutoSizeText(
            subtitle,
            style: TextStyleCollection.caption.copyWith(
              color: ColorPrimary.primary900,
            ),
            minFontSize: 14,
            maxFontSize: 16,
            textAlign: TextAlign.center,
          ),
          const SizedBox(
            height: 24,
          ),
        ],
      ),
    );
  }
}
