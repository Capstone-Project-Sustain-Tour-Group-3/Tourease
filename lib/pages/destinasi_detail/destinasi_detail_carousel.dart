import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:tourease/constants/color_constant.dart';
import 'package:tourease/controllers/detail_destinasi_controller.dart';

class DetailDestinasiCarousel extends StatelessWidget {
  const DetailDestinasiCarousel({super.key});

  @override
  Widget build(BuildContext context) {
    final DetailDestinasiController controller =
        Get.put(DetailDestinasiController());

    return Obx(
      () => Column(
        children: [
          CarouselSlider.builder(
            carouselController: controller.carouselController,
            itemCount: controller.imageUrls.length,
            itemBuilder: (context, index, realIndex) {
              return SizedBox(
                width: double.infinity,
                height: 200,
                child: CachedNetworkImage(
                  imageUrl: controller.imageUrls[index],
                  fit: BoxFit.cover,
                  placeholder: (context, url) => const Center(
                    child: CircularProgressIndicator(),
                  ),
                  errorWidget: (context, url, error) => const Icon(Icons.error),
                ),
              );
            },
            options: CarouselOptions(
              onPageChanged: (index, reason) {
                controller.activeIndex.value = index;
              },
              height: 220,
              autoPlay: false,
              viewportFraction: 1,
            ),
          ),
          const SizedBox(
            height: 8,
          ),
          AnimatedSmoothIndicator(
            activeIndex: controller.activeIndex.value,
            count: controller.imageUrls.length,
            effect: ExpandingDotsEffect(
              dotHeight: 8,
              dotWidth: 8,
              dotColor: ColorNeutral.neutral200,
              activeDotColor: ColorSecondary.secondary500,
            ),
          )
        ],
      ),
    );
  }
}
