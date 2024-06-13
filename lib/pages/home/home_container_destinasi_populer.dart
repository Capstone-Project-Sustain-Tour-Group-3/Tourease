import 'dart:io';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';
import 'package:tourease/constants/color_constant.dart';
import 'package:tourease/constants/text_style_constant.dart';
import 'package:tourease/controllers/video_thumbnail_home_controller.dart';
import 'package:tourease/pages/video_content/video_content_page.dart';

class HomeContainerDestinasiPopuler extends StatelessWidget {
  const HomeContainerDestinasiPopuler({
    super.key,
    required this.url,
    required this.deskripsiVideo,
  });

  final String url;
  final String deskripsiVideo;

  @override
  Widget build(BuildContext context) {
    final VideoThumbnailHomeController controller =
        Get.put(VideoThumbnailHomeController());

    WidgetsBinding.instance.addPostFrameCallback(
      (_) {
        controller.getThumbnail(url);
      },
    );

    return Obx(
      () {
        if (controller.isLoadingThumbnailHome.value) {
          return SizedBox(
            width: 142,
            height: 230,
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
          );
        } else {
          return Container(
            width: 142,
            height: 230,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              image: DecorationImage(
                image: FileImage(File(controller.thumbnailPath.value)),
                fit: BoxFit.cover,
                colorFilter: ColorFilter.mode(
                  ColorCollection.black.withOpacity(0.3),
                  BlendMode.colorBurn,
                ),
              ),
            ),
            child: Stack(
              children: [
                Center(
                  child: IconButton(
                    onPressed: () {
                      Get.to(() => const VideoContentPage(
                            url: '',
                            deskripsiVideo: '',
                            namaDestinasi: '',
                          ));
                    },
                    icon: Icon(
                      Icons.play_arrow,
                      color: ColorNeutral.neutral50,
                      size: 50,
                    ),
                  ),
                ),
                Positioned(
                  bottom: 10,
                  left: 10,
                  right: 10,
                  child: SizedBox(
                    width: double.infinity,
                    child: AutoSizeText(
                      deskripsiVideo,
                      style: TextStyleCollection.captionBold.copyWith(
                        color: ColorCollection.lightGray,
                      ),
                      minFontSize: 11,
                      maxFontSize: 12,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                )
              ],
            ),
          );
        }
      },
    );
  }
}
