import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tourease/constants/color_constant.dart';
import 'package:tourease/constants/status_bar_constant.dart';
import 'package:tourease/constants/text_style_constant.dart';
import 'package:tourease/controllers/video_content_controller.dart';
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
      body: Stack(
        children: [
          Obx(
            () {
              if (videoController.isInitialized.value) {
                return Center(
                  child: AspectRatio(
                    aspectRatio: 9 / 16,
                    child: GestureDetector(
                      onTap: () {
                        videoController.playPause();
                      },
                      child: Container(
                        width: double.infinity,
                        height: double.infinity,
                        margin: const EdgeInsets.all(4),
                        child: Stack(
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(12),
                              child: VideoPlayer(
                                videoController.videoPlayerController,
                              ),
                            ),
                            Positioned(
                              bottom: 12,
                              left: 12,
                              right: 12,
                              child: SizedBox(
                                width: double.infinity,
                                child: AutoSizeText(
                                  'Membatik dan belajar sejarah keraton di museum Ullen Sentalu',
                                  style:
                                      TextStyleCollection.captionBold.copyWith(
                                    color: ColorCollection.lightGray,
                                  ),
                                  minFontSize: 14,
                                  maxFontSize: 16,
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
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
          Obx(
            () {
              if (videoController.isCompleted.value) {
                WidgetsBinding.instance.addPostFrameCallback(
                  (_) {
                    videoController.replayVideo();
                  },
                );
                return const SizedBox.shrink();
              } else if (videoController.isPlaying.value == false) {
                return Center(
                  child: IconButton(
                    onPressed: () {
                      videoController.playPause();
                    },
                    icon: Icon(
                      Icons.play_arrow,
                      size: 48,
                      color: ColorNeutral.neutral50,
                    ),
                  ),
                );
              } else {
                return const SizedBox.shrink();
              }
            },
          ),
        ],
      ),
    );
  }
}
