import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:tourease/constants/color_constant.dart';
import 'package:tourease/constants/text_style_constant.dart';
import 'package:tourease/pages/saved_route/saved_route_bottom_sheet.dart';

class SavedRouteHomeListTile extends StatelessWidget {
  const SavedRouteHomeListTile({
    super.key,
    required this.title,
    required this.biaya,
    required this.onPressedHapus,
  });

  final String title;
  final String biaya;
  final void Function() onPressedHapus;

  @override
  Widget build(BuildContext context) {
    return Card.outlined(
      // color: ColorCollection.white,
      // surfaceTintColor: ColorCollection.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(4),
        side: BorderSide(
          color: ColorNeutral.neutral200,
          width: 1,
        ),
      ),
      child: ListTile(
        contentPadding: const EdgeInsets.symmetric(horizontal: 16)
            .copyWith(right: 0), //right: 6
        title: AutoSizeText(
          title,
          style: TextStyleCollection.bodyBold
              .copyWith(color: ColorPrimary.primary500),
          minFontSize: 14,
          maxFontSize: 16,
        ),
        subtitle: AutoSizeText(
          'Estimasi Biaya - $biaya',
          style: TextStyleCollection.caption
              .copyWith(color: ColorNeutral.neutral700),
          minFontSize: 14,
          maxFontSize: 16,
        ),
        trailing: SavedRouteBottomSheet(
          onPressedHapus: onPressedHapus,
        ),
      ),
    );
  }
}
