import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:tourease/constants/assets_constant.dart';
import 'package:tourease/constants/color_constant.dart';
import 'package:tourease/constants/text_style_constant.dart';

class SavedRouteResultZero extends StatelessWidget {
  const SavedRouteResultZero({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SvgPicture.asset(
          AssetsCollection.emptySavedRoute,
          height: 190,
          width: 144,
        ),
        const SizedBox(
          height: 32,
        ),
        Text(
          'Ubah Setiap Perjalanan Menjadi Pengalaman Tak Terlupakan, Simpan Rutenya!',
          style: TextStyleCollection.captionMedium.copyWith(
            color: ColorNeutral.neutral800,
            fontSize: 14,
          ),
          textAlign: TextAlign.center,
        )
      ],
    );
  }
}
