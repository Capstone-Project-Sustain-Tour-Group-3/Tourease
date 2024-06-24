import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:tourease/constants/color_constant.dart';
import 'package:tourease/constants/text_style_constant.dart';

class ProfilTentangKamiTextWidget extends StatelessWidget {
  final String title;
  final String description;
  const ProfilTentangKamiTextWidget(
      {super.key, required this.title, required this.description});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Align(
            alignment: Alignment.centerLeft,
            child: AutoSizeText(
              title,
              style: TextStyleCollection.bodyBold
                  .copyWith(color: ColorPrimary.primary500),
              minFontSize: 16,
              maxFontSize: 18,
            )),
        const SizedBox(
          height: 8,
        ),
        AutoSizeText(
          textAlign: TextAlign.justify,
          description,
          style: TextStyleCollection.caption
              .copyWith(color: ColorNeutral.neutral700),
          minFontSize: 14,
          maxFontSize: 16,
        )
      ],
    );
  }
}
