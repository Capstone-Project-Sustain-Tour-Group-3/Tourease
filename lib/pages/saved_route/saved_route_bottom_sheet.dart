import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:tourease/constants/assets_constant.dart';
import 'package:tourease/constants/color_constant.dart';
import 'package:tourease/constants/text_style_constant.dart';
import 'package:tourease/widgets/button_widget.dart';

class SavedRouteBottomSheet extends StatelessWidget {
  const SavedRouteBottomSheet({
    super.key,
    required this.onPressedHapus,
  });

  final void Function() onPressedHapus;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        Get.bottomSheet(
          Container(
            width: double.infinity,
            decoration: BoxDecoration(
              color: ColorCollection.white,
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(12),
                topRight: Radius.circular(12),
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                const SizedBox(
                  height: 16,
                ),
                Center(
                  child: Container(
                    width: 70,
                    height: 5,
                    decoration: BoxDecoration(
                      color: ColorNeutral.neutral200,
                      borderRadius: BorderRadius.circular(
                        2,
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 48,
                ),
                SvgPicture.asset(
                  AssetsCollection.deleteRoute,
                  height: 140,
                ),
                const SizedBox(height: 12),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.delete_outline,
                      color: ColorDanger.danger400,
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    AutoSizeText(
                      'Hapus Rute?',
                      style: TextStyleCollection.subtitleBold.copyWith(
                        color: ColorDanger.danger500,
                      ),
                      minFontSize: 18,
                      maxFontSize: 20,
                    ),
                  ],
                ),
                AutoSizeText(
                  'Rute yang sudah dihapus tidak \nbisa dikembalikan lagi.',
                  style: TextStyleCollection.captionMedium.copyWith(
                    color: ColorNeutral.neutral800,
                  ),
                  maxLines: 2,
                  minFontSize: 14,
                  maxFontSize: 16,
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 12),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  child: SizedBox(
                    width: double.infinity,
                    height: 48,
                    child: ButtonWidget(
                      onPressed: onPressedHapus,
                      text: 'Hapus',
                      textColor: ColorNeutral.neutral50,
                      backgroundColor: ColorDanger.danger400,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 24,
                ),
              ],
            ),
          ),
        );
      },
      icon: Icon(
        Icons.delete_outline,
        color: ColorDanger.danger400,
      ),
    );
  }
}
