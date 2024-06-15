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
    return Stack(
      children: [
        Container(
          width: double.infinity,
          height: 164,
          margin: const EdgeInsets.symmetric(horizontal: 16),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(16),
            child: CachedNetworkImageWidget(
              width: double.infinity,
              height: 164,
              gradient: LinearGradient(
                begin: Alignment.bottomCenter,
                end: Alignment.topCenter,
                stops: const [0.1, 0.35, 0.6],
                colors: [
                  ColorCollection.black.withOpacity(0.75),
                  ColorCollection.black.withOpacity(0.5),
                  ColorCollection.transparent,
                ],
              ),
              imageUrl: imageUrl,
              placeholder: (context, url) => ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: Shimmer.fromColors(
                  baseColor: ColorNeutral.neutral50,
                  highlightColor: ColorNeutral.neutral300,
                  child: Container(
                    width: double.infinity,
                    height: 164,
                    color: ColorNeutral.neutral300,
                  ),
                ),
              ),
              errorWidget: (context, url, error) => Center(
                child: Icon(
                  Icons.error,
                  color: ColorDanger.danger500,
                  size: 48,
                ),
              ),
            ),
          ),
        ),
        Positioned(
          left: 12,
          right: 12,
          bottom: 12,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
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
                    Expanded(
                      child: AutoSizeText(
                        location,
                        style: TextStyleCollection.caption.copyWith(
                          color: ColorNeutral.neutral50,
                        ),
                        minFontSize: 14,
                        maxFontSize: 18,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        )
      ],
    );
  }
}
