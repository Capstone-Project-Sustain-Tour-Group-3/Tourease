import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:tourease/constants/color_constant.dart';
import 'package:tourease/constants/text_style_constant.dart';
import 'package:tourease/widgets/cached_network_image_widget.dart';

class PersonalizedCategories extends StatelessWidget {
  const PersonalizedCategories({
    super.key,
    required this.image,
    required this.title,
    required this.isSelected,
    required this.onTap,
  });

  final String image;
  final String title;
  final bool isSelected;
  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.only(top: 24, left: 24, right: 24),
        child: Center(
          child: SizedBox(
            height: 128,
            child: Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Stack(
                    children: [
                      CachedNetworkImageWidget(
                        imageUrl: image,
                        width: 300,
                        height: 128,
                      ),
                      if (isSelected)
                        Container(
                          width: 300,
                          height: 128,
                          color: Colors.black.withOpacity(0.5),
                        )
                    ],
                  ),
                ),
                Positioned(
                  bottom: 16,
                  left: 16,
                  child: AutoSizeText(
                    title,
                    style: TextStyleCollection.bodyMedium
                        .copyWith(color: ColorNeutral.neutral50),
                    textAlign: TextAlign.left,
                    minFontSize: 16,
                    maxFontSize: 18,
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
      ),
    );
  }
}
