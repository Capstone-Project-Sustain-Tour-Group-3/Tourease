import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:tourease/constants/color_constant.dart';
import 'package:tourease/controllers/home_controller.dart';

class HomePilihanDestinasiUntukAnda extends StatelessWidget {
  const HomePilihanDestinasiUntukAnda({super.key});

  @override
  Widget build(BuildContext context) {
    final HomeController homeController = Get.put(HomeController());

    return Obx(
      () => Column(
        children: [
          CarouselSlider.builder(
            carouselController: homeController.carouselController,
            itemCount: homeController.listContainerPilihanDestinasi.length,
            itemBuilder: (context, index, realIndex) {
              return homeController.listContainerPilihanDestinasi[index];
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
          AnimatedSmoothIndicator(
            activeIndex: homeController.activeIndex.value,
            count: homeController.listContainerPilihanDestinasi.length,
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
