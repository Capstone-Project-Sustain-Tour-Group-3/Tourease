import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tourease/constants/color_constant.dart';
import 'package:tourease/constants/text_style_constant.dart';
import 'package:tourease/controllers/detail_destinasi_controller.dart';
import 'package:tourease/pages/destinasi_detail/destinasi_detail_fasilitas_card.dart';

class DestinasiDetailFasilitas extends StatelessWidget {
  const DestinasiDetailFasilitas({super.key});

  @override
  Widget build(BuildContext context) {
    final DetailDestinasiController controller =
        Get.put(DetailDestinasiController());

    return Obx(
      () => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Fasilitas',
            style: TextStyleCollection.bodyBold
                .copyWith(fontSize: 16, color: ColorPrimary.primary700),
          ),
          const SizedBox(height: 8),
          SizedBox(
            height: 100,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount:
                  controller.detailDestinasi.value.data?.fasilitas?.length ?? 0,
              itemBuilder: (context, index) {
                final fasilitas =
                    controller.detailDestinasi.value.data?.fasilitas?[index];
                return FacilityCard(
                  url: fasilitas?.urlLogo ?? '',
                  label: fasilitas?.nama ?? '',
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
