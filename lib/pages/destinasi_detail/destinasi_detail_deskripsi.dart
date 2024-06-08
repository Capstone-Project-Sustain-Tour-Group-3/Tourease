import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:tourease/constants/color_constant.dart';
import 'package:tourease/constants/text_style_constant.dart';

class DestinasiDetailDeskripsi extends StatelessWidget {
  final String title;
  final String description;

  const DestinasiDetailDeskripsi({
    super.key,
    this.title = 'Deskripsi',
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AutoSizeText(
          minFontSize: 16,
          maxFontSize: 18,
          title,
          style: TextStyleCollection.bodyBold
              .copyWith(color: ColorPrimary.primary700),
        ),
        const SizedBox(height: 8),
        Text(
          description,
          style: TextStyleCollection.caption.copyWith(
            color: ColorNeutral.neutral900,
            fontSize: 14,
          ),
        ),
      ],
    );
  }
}
