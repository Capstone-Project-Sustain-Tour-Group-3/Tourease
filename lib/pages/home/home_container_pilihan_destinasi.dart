import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:shimmer/shimmer.dart';
import 'package:tourease/constants/assets_constant.dart';
import 'package:tourease/constants/color_constant.dart';
import 'package:tourease/constants/text_style_constant.dart';
import 'package:tourease/widgets/cached_network_image_widget.dart';

class HomeContainerDestination extends StatelessWidget {
  const HomeContainerDestination({
    super.key,
    required this.imageUrl,
    required this.location,
  });

  final String imageUrl;
  final String location;

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImageWidget(
      imageUrl: imageUrl,
      imageBuilder: (context, imageProvider) => Container(
        width: double.infinity,
        height: 164,
        margin: const EdgeInsets.symmetric(horizontal: 16),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          image: DecorationImage(
            image: imageProvider,
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(
              ColorCollection.black.withOpacity(0.4),
              BlendMode.colorBurn,
            ),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AutoSizeText(
                'Pilihan Destinasi untuk anda',
                style: TextStyleCollection.subtitleBold.copyWith(
                  color: ColorNeutral.neutral50,
                ),
                minFontSize: 18,
                maxFontSize: 22,
              ),
              Row(
                children: [
                  SvgPicture.asset(
                    AssetsCollection.locationIcon,
                    width: 12,
                    colorFilter: ColorFilter.mode(
                      ColorNeutral.neutral50,
                      BlendMode.srcIn,
                    ),
                  ),
                  const SizedBox(
                    width: 4,
                  ),
                  AutoSizeText(
                    location,
                    style: TextStyleCollection.caption.copyWith(
                      color: ColorNeutral.neutral50,
                    ),
                    minFontSize: 14,
                    maxFontSize: 18,
                  ),
                ],
              )
            ],
          ),
        ),
      ),
      placeholder: (context, url) => ClipRRect(
        borderRadius: BorderRadius.circular(12),
        child: Shimmer.fromColors(
          baseColor: ColorNeutral.neutral50,
          highlightColor: ColorNeutral.neutral300,
          child: Container(
            width: double.infinity,
            height: 164,
            color: ColorNeutral.neutral300,
            margin: const EdgeInsets.symmetric(horizontal: 16),
          ),
        ),
      ),
      errorWidget: (context, url, error) => const Center(
        child: Icon(
          Icons.error,
          size: 48,
        ),
      ),
    );
  }
}
