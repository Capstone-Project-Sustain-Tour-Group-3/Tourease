import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:tourease/constants/color_constant.dart';
import 'package:tourease/controllers/detail_destinasi_controller.dart';
import 'package:tourease/widgets/cached_network_image_widget.dart';

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
            itemCount:
                controller.detailDestinasi.value.data?.urlGambar?.length ?? 0,
            itemBuilder: (context, index, realIndex) {
              return CachedNetworkImageWidget(
                imageUrl: controller.detailDestinasi.value.data
                        ?.urlGambar?[index].urlMedia ??
                    '',
                width: double.infinity,
                height: 200,
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
            count:
                controller.detailDestinasi.value.data?.urlGambar?.length ?? 0,
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
