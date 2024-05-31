import 'package:flutter/material.dart';
import 'package:tourease/constants/assets_constant.dart';
import 'package:tourease/constants/color_constant.dart';
import 'package:tourease/constants/text_style_constant.dart';
import 'package:tourease/pages/destinasi_detail/destinasi_detail_fasilitas_card.dart';

class DestinasiDetailFasilitas extends StatelessWidget {
  const DestinasiDetailFasilitas({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Fasilitas',
          style: TextStyleCollection.bodyBold
              .copyWith(fontSize: 16, color: ColorPrimary.primary700),
        ),
        const SizedBox(height: 8),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              FacilityCard(
                iconAsset: AssetsCollection.parkingIcon,
                label: 'Area Parkir',
              ),
              SizedBox(width: 8),
              FacilityCard(
                iconAsset: AssetsCollection.bedIcon,
                label: 'Penginapan',
              ),
              SizedBox(width: 8),
              FacilityCard(
                iconAsset: AssetsCollection.bedIcon,
                label: 'Tempat Makan',
              ),
            ],
          ),
        ),
      ],
    );
  }
}
