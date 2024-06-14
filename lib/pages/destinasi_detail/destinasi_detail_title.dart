import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:tourease/constants/color_constant.dart';
import 'package:tourease/constants/text_style_constant.dart';

class TitleSectionWidget extends StatelessWidget {
  final String title;
  final String location;
  final String time;
  final String price;
  final String category;
  final String view;

  const TitleSectionWidget({
    super.key,
    required this.title,
    required this.location,
    required this.time,
    required this.price,
    required this.category,
    required this.view,
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
        const SizedBox(height: 4),
        Padding(
          padding: const EdgeInsets.only(left: 4),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Icon(
                Icons.remove_red_eye,
                size: 16,
                color: ColorCollection.black,
              ),
              const SizedBox(width: 14),
              Text(
                view,
                style: TextStyleCollection.captionMedium.copyWith(
                  color: ColorNeutral.neutral900,
                  fontSize: 12,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 8),
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(
              Icons.place,
              color: ColorCollection.black,
            ),
            const SizedBox(width: 12),
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
        const SizedBox(height: 8),
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(
              Icons.access_time,
              color: ColorCollection.black,
            ),
            const SizedBox(width: 12),
            Text(
              time,
              style: TextStyleCollection.captionMedium.copyWith(
                color: ColorNeutral.neutral900,
                fontSize: 14,
              ),
            ),
          ],
        ),
        const SizedBox(height: 8),
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(
              Icons.attach_money,
              color: ColorCollection.black,
            ),
            const SizedBox(width: 12),
            Text(
              price,
              style: TextStyleCollection.captionMedium.copyWith(
                color: ColorNeutral.neutral900,
                fontSize: 14,
              ),
            ),
          ],
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
