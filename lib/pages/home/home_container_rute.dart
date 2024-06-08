import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:tourease/constants/color_constant.dart';
import 'package:tourease/constants/text_style_constant.dart';

class HomeContainerRute extends StatelessWidget {
  const HomeContainerRute({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        color: ColorNeutral.neutral50,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: ColorCollection.black.withOpacity(0.1),
            offset: const Offset(0, 8),
            blurRadius: 16,
            blurStyle: BlurStyle.normal,
          )
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AutoSizeText(
                  'Eksplorasi Baru Dimulai Di Sini!',
                  style: TextStyleCollection.bodyBold.copyWith(
                    color: ColorPrimary.primary600,
                  ),
                  minFontSize: 16,
                  maxFontSize: 18,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                AutoSizeText(
                  'buat rute baru untuk petualangan seru',
                  style: TextStyleCollection.captionMedium.copyWith(
                    color: ColorNeutral.neutral600,
                  ),
                  minFontSize: 14,
                  maxFontSize: 16,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                )
              ],
            ),
            Expanded(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  const SizedBox(
                    width: 8,
                  ),
                  GestureDetector(
                    onTap: () {},
                    child: Container(
                      width: 44,
                      height: 44,
                      decoration: BoxDecoration(
                        color: ColorPrimary.primary500,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Center(
                        child: Icon(
                          Icons.arrow_forward,
                          color: ColorNeutral.neutral50,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
