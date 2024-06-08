import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';
import 'package:tourease/constants/color_constant.dart';
import 'package:tourease/constants/text_style_constant.dart';
import 'package:tourease/controllers/destinasi_controller.dart';
import 'package:tourease/pages/home/home_card_destinasi.dart';
import 'package:tourease/pages/home/home_card_destinasi_lainnya.dart';

class HomeListDestinasi extends StatelessWidget {
  const HomeListDestinasi({super.key});

  @override
  Widget build(BuildContext context) {
    final DestinasiController destinasiController = Get.put(
      DestinasiController(),
    );

    WidgetsBinding.instance.addPostFrameCallback(
      (_) {
        destinasiController.searchDestinasi();
      },
    );

    return Container(
      width: double.infinity,
      margin: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AutoSizeText(
            'Jelajahi Wisata Nusantara',
            style: TextStyleCollection.subtitleBold.copyWith(
              color: ColorPrimary.primary700,
            ),
            minFontSize: 18,
            maxFontSize: 20,
          ),
          const SizedBox(
            height: 16,
          ),
          Container(
            height: 228,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
            ),
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: 5,
              itemBuilder: (context, index) {
                if (index < 4) {
                  return Obx(
                    () => destinasiController.isLoadingSearchDestinasi.value
                        ? SizedBox(
                            width: 220,
                            child: Card(
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(12),
                                child: Shimmer.fromColors(
                                  baseColor: ColorNeutral.neutral50,
                                  highlightColor: ColorNeutral.neutral300,
                                  child: Container(
                                    color: ColorNeutral.neutral300,
                                  ),
                                ),
                              ),
                            ),
                          )
                        : HomeCardDestinasi(
                            id: destinasiController
                                    .destinasiResponse.value.data?[index].id ??
                                '',
                            url: destinasiController.destinasiResponse.value
                                    .data?[index].urlMedia ??
                                '',
                            namaDestinasi: destinasiController.destinasiResponse
                                    .value.data?[index].nama ??
                                '',
                            lokasiDestinasi:
                                '${destinasiController.destinasiResponse.value.data?[index].kota}, ${destinasiController.destinasiResponse.value.data?[index].provinsi}',
                          ),
                  );
                } else {
                  return const HomeCardDestinasiLainnya();
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
