import 'package:flutter/material.dart';
import 'package:tourease/constants/color_constant.dart';
import 'package:tourease/constants/text_style_constant.dart';

class CityNameWidget extends StatelessWidget {
  const CityNameWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 16, right: 12, bottom: 24, top: 16),
      child: Text(
        "Banyuwangi",
        style: TextStyleCollection.subtitleBold.copyWith(
          color: ColorNeutral.neutral900,
          fontSize: 18,
        ),
      ),
    );
  }
}
