import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:tourease/constants/color_constant.dart';
import 'package:tourease/controllers/home_controller.dart';
import 'package:tourease/pages/home/home_container_pilihan_destinasi.dart';

class HomePilihanDestinasiUntukAnda extends StatelessWidget {
  const HomePilihanDestinasiUntukAnda({super.key});

  @override
  Widget build(BuildContext context) {
    final HomeController homeController = Get.put(HomeController());

    return Obx(
      () {
        if (homeController.isLoadingDestinasiPilihan.value ||
            homeController.listDestinasiPilihan.isEmpty) {
          return ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: SizedBox(
              width: double.infinity,
              height: 164,
              child: Shimmer.fromColors(
                baseColor: ColorNeutral.neutral50,
                highlightColor: ColorNeutral.neutral300,
                child: Container(
                  width: double.infinity,
                  height: 164,
                  margin: const EdgeInsets.symmetric(horizontal: 16),
                  decoration: BoxDecoration(
                    color: ColorNeutral.neutral300,
                    borderRadius: BorderRadius.circular(16),
                  ),
                ),
              ),
            ),
          );
        } else {
          return Column(
            children: [
              CarouselSlider.builder(
                carouselController: homeController.carouselController,
                itemCount: homeController.listDestinasiPilihan.length,
                itemBuilder: (context, index, realIndex) {
                  final destinasiPilihan =
                      homeController.listDestinasiPilihan[index];
                  return HomeContainerDestination(
                    imageUrl: destinasiPilihan.urlGambar ?? '',
                    location:
                        '${destinasiPilihan.nama}, ${destinasiPilihan.provinsi!.nama}',
                  );
                },
                options: CarouselOptions(
                  onPageChanged: (index, reason) {
                    homeController.activeIndex.value = index;
                  },
                  height: 164,
                  autoPlay: true,
                  viewportFraction: 1,
                ),
              ),
              const SizedBox(
                height: 8,
              ),
              Obx(
                () => AnimatedSmoothIndicator(
                  activeIndex: homeController.activeIndex.value,
                  count: homeController.listDestinasiPilihan.length,
                  effect: ExpandingDotsEffect(
                    dotHeight: 8,
                    dotWidth: 8,
                    dotColor: ColorNeutral.neutral200,
                    activeDotColor: ColorSecondary.secondary500,
                  ),
                ),
              ),
            ],
          );
        }
      },
    );
  }
}
