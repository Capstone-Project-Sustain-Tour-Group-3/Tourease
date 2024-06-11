import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:tourease/constants/assets_constant.dart';
import 'package:tourease/constants/color_constant.dart';
import 'package:tourease/constants/text_style_constant.dart';

class TitleSectionWidget extends StatelessWidget {
  final String title;
  final String location;
  final String time;
  final String price;
  final String category;

  const TitleSectionWidget({
    super.key,
    required this.title,
    required this.location,
    required this.time,
    required this.price,
    required this.category,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyleCollection.bodyBold
              .copyWith(fontSize: 20, color: ColorPrimary.primary500),
        ),
        const SizedBox(height: 8),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SvgPicture.asset(
                AssetsCollection.locationIcon2, // Path to your SVG file
                width: 20,
                height: 20,
              ),
              const SizedBox(width: 11),
              Expanded(
                child: Text(
                  location,
                  style: TextStyleCollection.captionMedium.copyWith(
                    color: ColorNeutral.neutral900,
                    fontSize: 14,
                  ),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 8),
        Padding(
          padding: const EdgeInsets.all(5.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SvgPicture.asset(AssetsCollection.clockIcon,
                  width: 20, height: 20),
              const SizedBox(width: 9),
              Text(
                time,
                style: TextStyleCollection.captionMedium.copyWith(
                  color: ColorNeutral.neutral900,
                  fontSize: 14,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 8),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SvgPicture.asset(AssetsCollection.dollarIcon,
                  width: 20, height: 20),
              const SizedBox(width: 13),
              Text(
                price,
                style: TextStyleCollection.captionMedium.copyWith(
                  color: ColorNeutral.neutral900,
                  fontSize: 14,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 16),
        Row(
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
              decoration: BoxDecoration(
                color: ColorNeutral.neutral100,
                borderRadius: BorderRadius.circular(16),
              ),
              child: Center(
                child: AutoSizeText(
                  maxFontSize: 16,
                  minFontSize: 14,
                  category,
                  style: TextStyleCollection.caption.copyWith(
                    color: ColorNeutral.neutral900,
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
