import 'package:flutter/material.dart';
import 'package:tourease/constants/color_constant.dart';
import 'package:tourease/constants/text_style_constant.dart';

class StartingPlaceWidget extends StatelessWidget {
  const StartingPlaceWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: ColorCollection.white,
          border: Border.all(
            color: ColorNeutral.neutral200,
            width: 1,
          ),
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: ColorCollection.black.withOpacity(0.05),
              offset: const Offset(0, 12),
              blurRadius: 24,
            ),
          ],
        ),
        width: 210,
        height: 46,
        child: Row(
          children: [
            Text(
              'Hotel Ketapang Indah',
              style: TextStyleCollection.captionBold.copyWith(
                color: ColorNeutral.neutral800,
                fontSize: 14,
              ),
            ),
          ],
        ));
  }
}
