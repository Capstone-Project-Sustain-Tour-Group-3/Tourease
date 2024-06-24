import 'package:auto_size_text/auto_size_text.dart';
import 'package:expandable_richtext/expandable_rich_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tourease/constants/color_constant.dart';
import 'package:tourease/constants/status_bar_constant.dart';
import 'package:tourease/constants/text_style_constant.dart';
import 'package:tourease/controllers/video_content_controller.dart';
import 'package:tourease/pages/video_content/video_content_play_and_pause.dart';
import 'package:video_player/video_player.dart';

class VideoContentPage extends StatelessWidget {
  const VideoContentPage({
    super.key,
    required this.url,
    required this.namaDestinasi,
    required this.deskripsiVideo,
  });

  final String url;
  final String namaDestinasi;
  final String deskripsiVideo;

  @override
  Widget build(BuildContext context) {
    StatusBarConstant.statusBar;

    final VideoController videoController = Get.put(VideoController(url: url));

    return Scaffold(
      backgroundColor: ColorNeutral.neutral50,
      body: Obx(
        () {
          if (videoController.isInitialized.value) {
            return GestureDetector(
              onTap: () {
                videoController.playPause();
              },
              child: Stack(
                children: [
                  SizedBox(
                    width: double.infinity,
                    height: double.infinity,
                    child: VideoPlayer(
                      videoController.videoPlayerController,
                    ),
                  ),
                  Obx(
                    () => AnimatedOpacity(
                      opacity: videoController.isDarkOverlayVisible.value
                          ? 0.5
                          : 0.0,
                      duration: const Duration(milliseconds: 300),
                      child: Container(
                        color: Colors.black,
                      ),
                    ),
                  ),
                  Positioned(
                    top: 0,
                    left: 0,
                    right: 0,
                    child: Container(
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                            ColorCollection.black.withOpacity(0.9),
                            ColorCollection.transparent,
                          ],
                        ),
                      ),
                      child: AppBar(
                        backgroundColor: ColorCollection.transparent,
                        surfaceTintColor: ColorCollection.transparent,
                        leading: IconButton(
                          onPressed: () {
                            Get.back();
                          },
                          icon: Icon(
                            Icons.arrow_back,
                            color: ColorNeutral.neutral50,
                          ),
                        ),
                        title: AutoSizeText(
                          namaDestinasi,
                          style: TextStyleCollection.subtitleBold.copyWith(
                            color: ColorNeutral.neutral50,
                          ),
                          minFontSize: 16,
                          maxFontSize: 18,
                        ),
                        centerTitle: true,
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 16,
                    left: 16,
                    right: 16,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ExpandableRichText(
                        '$deskripsiVideo\n',
                        style: TextStyleCollection.captionMedium.copyWith(
                          color: ColorNeutral.neutral50,
                          fontSize: 14,
                        ),
                        maxLines: 1,
                        expandText: '',
                        collapseText: 'Sembunyikan',
                        expanded: false,
                        onExpandedChanged: (expanded) {
                          videoController.isDarkOverlayVisible.value = expanded;
                        },
                        toggleTextStyle:
                            TextStyleCollection.captionBold.copyWith(
                          color: ColorNeutral.neutral500,
                        ),
                      ),
                    ),
                  ),
                  VideoContentPlayAndPause(
                    videoController: videoController,
                  ),
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
