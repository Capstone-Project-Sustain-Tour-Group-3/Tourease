import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:tourease/constants/color_constant.dart';
import 'package:tourease/constants/text_style_constant.dart';
import 'package:tourease/pages/destinasi_detail/destinasi_detail_video.dart';

class DestinasiDetailVideoList extends StatelessWidget {
  const DestinasiDetailVideoList({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AutoSizeText(
          'Video',
          style: TextStyleCollection.subtitleBold.copyWith(
            color: ColorPrimary.primary700,
          ),
          minFontSize: 16,
          maxFontSize: 18,
        ),
        const SizedBox(height: 16),
        Container(
          height: 230,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
          ),
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: 5,
            itemBuilder: (context, index) {
              if (index < 4) {
                return const Padding(
                  padding: EdgeInsets.only(right: 8),
                  child: DestinasiDetailVideo(),
                );
              } else {
                return const DestinasiDetailVideo();
              }
            },
          ),
        ),
      ],
    );
  }
}
