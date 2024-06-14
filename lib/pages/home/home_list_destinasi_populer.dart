import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';
import 'package:tourease/constants/color_constant.dart';
import 'package:tourease/constants/text_style_constant.dart';
import 'package:tourease/controllers/home_controller.dart';
import 'package:tourease/pages/home/home_container_destinasi_populer.dart';

class HomeListDestinasiPopuler extends StatelessWidget {
  const HomeListDestinasiPopuler({super.key});

  @override
  Widget build(BuildContext context) {
    final HomeController homeController = Get.put(HomeController());

    return Container(
      width: double.infinity,
      margin: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AutoSizeText(
            'Destinasi Populer',
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
            height: 230,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
            ),
            child: Obx(
              () {
                if (homeController.isLoadingDestinasiPopuler.value ||
                    homeController.listDestinasiPopuler.isEmpty) {
                  return ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: 5,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.only(right: 8),
                        child: SizedBox(
                          width: 142,
                          height: 164,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(16),
                            child: Shimmer.fromColors(
                              baseColor: ColorNeutral.neutral50,
                              highlightColor: ColorNeutral.neutral300,
                              child: Container(
                                width: double.infinity,
                                height: 164,
                                color: ColorNeutral.neutral300,
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  );
                } else {
                  return Obx(
                    () => ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: homeController.listDestinasiPopuler.length,
                      itemBuilder: (context, index) {
                        final destinasiPopuler =
                            homeController.listDestinasiPopuler[index];
                        return Padding(
                          padding: const EdgeInsets.only(right: 8),
                          child: HomeContainerDestinasiPopuler(
                            url: destinasiPopuler.konten?.url ?? '',
                            deskripsiVideo:
                                destinasiPopuler.konten?.judul ?? '',
                            namaDestinasi: destinasiPopuler.nama ?? '',
                          ),
                        );
                      },
                    ),
                  );
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
