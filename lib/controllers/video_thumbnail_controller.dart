import 'package:get/get.dart';
import 'package:video_thumbnail/video_thumbnail.dart';
import 'package:path_provider/path_provider.dart';

class VideoThumbnailController extends GetxController {
  RxString thumbnailPath = ''.obs;
  RxBool isLoadingThumbnail = false.obs;

  Future<void> getThumbnail(String urlVideo) async {
    isLoadingThumbnail.value = true;
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
      isLoadingThumbnail.value = false;
    }
  }
}
