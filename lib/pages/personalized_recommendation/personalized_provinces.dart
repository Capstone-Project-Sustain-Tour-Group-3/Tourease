import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:tourease/constants/color_constant.dart';
import 'package:tourease/constants/text_style_constant.dart';
import 'package:tourease/widgets/cached_network_image_widget.dart';

class PersonalizedProvinces extends StatelessWidget {
  const PersonalizedProvinces(
      {super.key,
      required this.image,
      required this.title,
      required this.isSelected,
      required this.onTap});

  final String image;
  final String title;
  final bool isSelected;
  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Center(
        child: SizedBox(
          height: 90,
          child: Stack(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Stack(
                  children: [
                    CachedNetworkImageWidget(
                      imageUrl: image,
                      width: 165,
                      height: 90,
                      gradient: LinearGradient(
                        begin: Alignment.bottomCenter,
                        end: Alignment.topCenter,
                        stops: const [0, 0.6],
                        colors: [
                          ColorCollection.black.withOpacity(0.75),
                          ColorCollection.transparent,
                        ],
                      ),
                    ),
                    if (isSelected)
                      Container(
                        width: 165,
                        height: 90,
                        color: Colors.black.withOpacity(0.5),
                      )
                  ],
                ),
              ),
              Positioned(
                bottom: 8,
                left: 8,
                right: 4,
                child: AutoSizeText(
                  title,
                  style: TextStyleCollection.bodyMedium.copyWith(
                    color: ColorNeutral.neutral50,
                  ),
                  textAlign: TextAlign.left,
                  minFontSize: 12,
                  maxFontSize: 14,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              if (isSelected)
                Positioned(
                  top: 8,
                  right: 8,
                  child: Icon(
                    Icons.check_circle,
                    color: ColorNeutral.neutral50,
                    size: 24,
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
