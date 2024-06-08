import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tourease/constants/color_constant.dart';
import 'package:tourease/constants/text_style_constant.dart';
import 'package:tourease/controllers/detail_destinasi_controller.dart';
import 'package:tourease/pages/destinasi_detail/destinasi_detail_destinasi_serupa_card.dart';
import 'package:tourease/pages/destinasi_detail/destinasi_detail_page.dart';

class DestinasiDetailDestinasiSerupa extends StatelessWidget {
  const DestinasiDetailDestinasiSerupa({super.key});

  @override
  Widget build(BuildContext context) {
    final DetailDestinasiController controller =
        Get.put(DetailDestinasiController());

    return Obx(
      () => SizedBox(
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AutoSizeText(
              'Jelajahi Destinasi Serupa',
              style: TextStyleCollection.subtitleBold.copyWith(
                color: ColorPrimary.primary700,
              ),
              minFontSize: 18,
              maxFontSize: 20,
            ),
            const SizedBox(
              height: 16,
            ),
            SizedBox(
              height: 228,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: controller
                    .detailDestinasi.value.data?.destinasiSerupa?.length,
                itemBuilder: (context, index) {
                  final destinasiSerupa = controller
                      .detailDestinasi.value.data?.destinasiSerupa?[index];
                  return GestureDetector(
                    onTap: () {
                      controller.getDetailDestinasi(
                          id: destinasiSerupa?.id ?? '');
                      Get.to(
                        () => DestinasiDetailPage(
                          id: destinasiSerupa?.id ?? '',
                        ),
                      );
                    },
                    child: DestinasiDetailDestinasiSerupaCard(
                      url: destinasiSerupa?.urlMedia ?? '',
                      namaDestinasi: destinasiSerupa?.nama ?? '',
                      lokasiDestinasi:
                          '${destinasiSerupa?.kota ?? ''}, ${destinasiSerupa?.provinsi ?? ''}',
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
