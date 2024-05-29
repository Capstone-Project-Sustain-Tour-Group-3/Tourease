import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:tourease/constants/color_constant.dart';
import 'package:tourease/constants/text_style_constant.dart';
import 'package:tourease/widgets/cached_network_image_widget.dart';

class CardWidget extends StatelessWidget {
  const CardWidget({
    super.key,
    required this.imageUrl,
    required this.heightImage,
    required this.widthImage,
    required this.namaDestinasi,
    required this.lokasiDestinasi,
  });

  final String imageUrl;
  final double heightImage;
  final double widthImage;
  final String namaDestinasi;
  final String lokasiDestinasi;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: ColorNeutral.neutral50,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
        side: BorderSide(
          color: ColorNeutral.neutral200,
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: ClipRRect(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(12),
                topRight: Radius.circular(12),
              ),
              child: CachedNetworkImageWidget(
                imageUrl: imageUrl,
                height: heightImage,
                width: widthImage,
                fit: BoxFit.cover,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                AutoSizeText(
                  namaDestinasi,
                  style: TextStyleCollection.bodyBold.copyWith(
                    color: ColorPrimary.primary500,
                  ),
                  minFontSize: 16,
                  maxFontSize: 18,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                AutoSizeText(
                  lokasiDestinasi,
                  style: TextStyleCollection.captionMedium.copyWith(
                    color: ColorNeutral.neutral800,
                  ),
                  minFontSize: 14,
                  maxFontSize: 16,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
