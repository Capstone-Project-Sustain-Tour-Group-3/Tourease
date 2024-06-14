import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';
import 'package:tourease/constants/color_constant.dart';
import 'package:tourease/constants/text_style_constant.dart';
import 'package:tourease/controllers/bottom_navbar_controller.dart';
import 'package:tourease/controllers/home_controller.dart';
import 'package:tourease/pages/bottom_navbar/bottom_navbar.dart';
import 'package:tourease/pages/home/home_card_destinasi.dart';

class HomeListDestinasi extends StatelessWidget {
  const HomeListDestinasi({super.key});

  @override
  Widget build(BuildContext context) {
    final HomeController homeController = Get.put(HomeController());

    final BottomNavbarController bottomNavbarController = Get.put(
      BottomNavbarController(),
    );

    return Container(
      width: double.infinity,
      margin: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AutoSizeText(
            'Jelajahi Wisata Sekitarmu',
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
            child: Obx(
              () {
                if (homeController.isLoadingDestinasiSekitar.value ||
                    homeController.listDestinasiSekitar.isEmpty) {
                  return ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: 5,
                    itemBuilder: (context, index) {
                      return SizedBox(
                        width: 220,
                        child: Card(
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(12),
                            child: Shimmer.fromColors(
                              baseColor: ColorNeutral.neutral50,
                              highlightColor: ColorNeutral.neutral300,
                              child: Container(
                                width: double.infinity,
                                height: double.infinity,
                                decoration: BoxDecoration(
                                  color: ColorNeutral.neutral300,
                                  borderRadius: BorderRadius.circular(16),
                                ),
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
                      itemCount: homeController.listDestinasiSekitar.length,
                      itemBuilder: (context, index) {
                        final destinasiSekitar =
                            homeController.listDestinasiSekitar[index];
                        return HomeCardDestinasi(
                          id: destinasiSekitar.id ?? '',
                          url: destinasiSekitar.urlGambar ?? '',
                          namaDestinasi: destinasiSekitar.nama ?? '',
                          lokasiDestinasi:
                              '${homeController.capitalizeEachWord(destinasiSekitar.lokasi?.kota?.nama ?? '')}, ${homeController.capitalizeEachWord(destinasiSekitar.lokasi?.provinsi?.nama ?? '')}',
                        );
                      },
                    ),
                  );
                }
              },
            ),
          ),
          const SizedBox(
            height: 4,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              TextButton(
                onPressed: () {
                  bottomNavbarController.selectedIndex.value = 1;
                  Get.to(
                    () => BottomNavbar(
                      initialIndex: bottomNavbarController.selectedIndex.value,
                    ),
                  );
                },
                style: TextButton.styleFrom(
                  backgroundColor: ColorNeutral.neutral50,
                  foregroundColor: ColorNeutral.neutral200,
                ),
                child: AutoSizeText(
                  'Selengkapnya >',
                  style: TextStyleCollection.bodyMedium.copyWith(
                    color: ColorPrimary.primary500,
                  ),
                  minFontSize: 14,
                  maxFontSize: 16,
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
