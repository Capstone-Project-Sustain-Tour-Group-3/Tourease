import 'package:get/get.dart';
import 'package:video_thumbnail/video_thumbnail.dart';
import 'package:path_provider/path_provider.dart';

class VideoThumbnailHomeController extends GetxController {
  RxString thumbnailPath = ''.obs;
  RxBool isLoadingThumbnailHome = false.obs;

  void getThumbnail(String urlVideo) async {
    isLoadingThumbnailHome.value = true;
    try {
      final thumbnail = await VideoThumbnail.thumbnailFile(
        video: urlVideo,
        thumbnailPath: (await getTemporaryDirectory()).path,
        imageFormat: ImageFormat.JPEG,
        maxHeight: 230,
        quality: 100,
      );
      thumbnailPath.value = thumbnail!;
    } catch (e) {
      e.toString();
    } finally {
      isLoadingThumbnailHome.value = false;
    }
  }
}
