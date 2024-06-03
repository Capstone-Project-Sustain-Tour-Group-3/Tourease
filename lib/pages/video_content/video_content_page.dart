import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tourease/constants/color_constant.dart';
import 'package:tourease/constants/status_bar_constant.dart';
import 'package:tourease/constants/text_style_constant.dart';
import 'package:tourease/controllers/video_content_controller.dart';
import 'package:tourease/pages/video_content/video_content_play_and_pause.dart';
import 'package:video_player/video_player.dart';

class VideoContentPage extends StatelessWidget {
  const VideoContentPage({super.key});

  @override
  Widget build(BuildContext context) {
    StatusBarConstant.statusBar;

    final VideoController videoController = Get.put(VideoController());

    return Scaffold(
      backgroundColor: ColorNeutral.neutral50,
      appBar: AppBar(
        backgroundColor: ColorNeutral.neutral50,
        surfaceTintColor: ColorNeutral.neutral50,
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: Icon(
            Icons.arrow_back,
            color: ColorPrimary.primary500,
          ),
        ),
        title: AutoSizeText(
          'Video Konten',
          style: TextStyleCollection.subtitleBold.copyWith(
            color: ColorNeutral.neutral900,
          ),
          minFontSize: 16,
          maxFontSize: 18,
        ),
        centerTitle: true,
      ),
      body: Obx(
        () {
          if (videoController.isInitialized.value) {
            return SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AspectRatio(
                    aspectRatio: 9 / 16,
                    child: GestureDetector(
                      onTap: () {
                        videoController.playPause();
                      },
                      child: SizedBox(
                        width: double.infinity,
                        height: double.infinity,
                        child: Stack(
                          children: [
                            VideoPlayer(
                              videoController.videoPlayerController,
                            ),
                            VideoContentPlayAndPause(
                              videoController: videoController,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                    ),
                    child: Text(
                      'Deskripsi',
                      style: TextStyleCollection.captionBold.copyWith(
                        color: ColorPrimary.primary500,
                        fontSize: 14,
                      ),
                      textAlign: TextAlign.justify,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 12,
                    ),
                    child: Text(
                      'Menikmati Pemandangan Indah Setelah Menelusuri Goa Jomblang di Gunung Kidul menjadi puncak kepuasan setelah petualangan yang mendebarkan di dalam goa. Dengan tiupan angin yang segar dan panorama alam yang menakjubkan, momen ini benar-benar menyegarkan jiwa dan pikiran.',
                      style: TextStyleCollection.captionMedium.copyWith(
                        color: ColorNeutral.neutral900,
                        fontSize: 14,
                      ),
                      textAlign: TextAlign.justify,
                    ),
                  )
                ],
              ),
            );
          } else {
            return Center(
              child: SizedBox(
                width: 50,
                height: 50,
                child: CircularProgressIndicator(
                  color: ColorPrimary.primary500,
                ),
              ),
            );
          }
        },
      ),
    );
  }
}
