import 'package:get/get.dart';
import 'package:video_player/video_player.dart';

class VideoController extends GetxController {
  late VideoPlayerController videoPlayerController;
  RxBool isPlaying = false.obs;
  RxBool isInitialized = false.obs;
  RxBool isCompleted = false.obs;
  RxString errorMessage = ''.obs;
  RxBool isDarkOverlayVisible = false.obs;
  final String url;

  VideoController({required this.url});

  @override
  void onInit() {
    videoPlayerController = VideoPlayerController.networkUrl(
      Uri.parse(url),
    )..initialize().then(
        (_) {
          isInitialized.value = true;
          videoPlayerController.play();
          isPlaying.value = true;

          videoPlayerController.addListener(
            () {
              if (videoPlayerController.value.position >=
                  videoPlayerController.value.duration) {
                isPlaying.value = false;
                isCompleted.value = true;
              }
            },
          );
        },
      ).catchError((error) {
        errorMessage.value = error.toString();
      });
    super.onInit();
  }

  void playPause() {
    if (videoPlayerController.value.isPlaying) {
      videoPlayerController.pause();
      isPlaying.value = false;
    } else {
      videoPlayerController.play();
      isPlaying.value = true;
      isCompleted.value = false;
    }
  }

  void replayVideo() {
    videoPlayerController.seekTo(Duration.zero);
    videoPlayerController.play();
    isPlaying.value = true;
    isCompleted.value = false;
  }

  @override
  void onClose() {
    videoPlayerController.dispose();
    super.onClose();
  }
}
