import 'package:flutter/material.dart';
import 'package:tourease/constants/color_constant.dart';
import 'package:tourease/constants/text_style_constant.dart';

class ResultRouteStartingPlaceWidget extends StatelessWidget {
  final String lokasiAwal;
  const ResultRouteStartingPlaceWidget({super.key, required this.lokasiAwal});

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
      // height: 110,
      child: Center(
        child: Text(
          lokasiAwal,
          overflow: TextOverflow.ellipsis,
          maxLines: 4,
          style: TextStyleCollection.captionBold.copyWith(
            color: ColorNeutral.neutral800,
            fontSize: 14,
          ),
        ),
      ),
    );
  }
}
