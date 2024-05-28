import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:tourease/constants/assets_constant.dart';
import 'package:tourease/constants/color_constant.dart';
import 'package:tourease/constants/text_style_constant.dart';

class ProfilContainer extends StatelessWidget {
  final String asset;
  final String text;
  final Function() function;

  const ProfilContainer(
      {super.key,
      required this.asset,
      required this.text,
      required this.function});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: function,
      child: Container(
        width: double.infinity,
        height: 48,
        margin: const EdgeInsets.only(
          bottom: 16,
          left: 16,
          right: 16,
        ),
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(8)),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
          child:
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            Row(
              children: [
                SvgPicture.asset(
                  asset,
                  width: 24,
                  height: 24,
                ),
                Container(
                  width: 208,
                  height: 22,
                  margin: const EdgeInsets.only(left: 16),
                  child: AutoSizeText(
                    text,
                    style: TextStyleCollection.captionMedium
                        .copyWith(color: ColorNeutral.neutral700),
                    minFontSize: 14,
                    maxFontSize: 16,
                  ),
                ),
              ],
            ),
            SvgPicture.asset(AssetsCollection.arrowRight),
          ]),
        ),
      ),
    );
  }
}
