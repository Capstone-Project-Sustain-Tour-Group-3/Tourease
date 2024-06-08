import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tourease/constants/color_constant.dart';
import 'package:tourease/constants/text_style_constant.dart';
import 'package:tourease/controllers/detail_destinasi_controller.dart';
import 'package:tourease/pages/destinasi_detail/destinasi_detail_video.dart';

class DestinasiDetailVideoList extends StatelessWidget {
  const DestinasiDetailVideoList({super.key});

  @override
  Widget build(BuildContext context) {
    final DetailDestinasiController controller =
        Get.put(DetailDestinasiController());

    return Obx(
      () => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AutoSizeText(
            'Video',
            style: TextStyleCollection.subtitleBold.copyWith(
              color: ColorPrimary.primary700,
            ),
            minFontSize: 16,
            maxFontSize: 18,
          ),
          const SizedBox(height: 16),
          Container(
            height: 230,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
            ),
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount:
                  controller.detailDestinasi.value.data?.urlVideo?.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.only(right: 8),
                  child: DestinasiDetailVideo(
                    url:
                        'https://videos.pexels.com/video-files/20770858/20770858-hd_1080_1920_30fps.mp4',
                    deskripsiVideo: controller.detailDestinasi.value.data
                            ?.urlVideo?[index].judul ??
                        '',
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
