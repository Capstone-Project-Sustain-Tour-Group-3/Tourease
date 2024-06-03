import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tourease/constants/color_constant.dart';
import 'package:tourease/controllers/video_content_controller.dart';

class VideoContentPlayAndPause extends StatelessWidget {
  const VideoContentPlayAndPause({
    super.key,
    required this.videoController,
  });

  final VideoController videoController;

  @override
  Widget build(BuildContext context) {
    return Obx(
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
    );
  }
}
