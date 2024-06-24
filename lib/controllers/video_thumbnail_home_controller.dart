import 'package:get/get.dart';
import 'package:video_thumbnail/video_thumbnail.dart';
import 'package:path_provider/path_provider.dart';

class VideoThumbnailHomeController extends GetxController {
  var thumbnailPaths = <String, String>{}.obs;
  var loadingThumbnails = <String, bool>{}.obs;

  Future<void> getThumbnail(String urlVideo) async {
    if (thumbnailPaths.containsKey(urlVideo) ||
        loadingThumbnails[urlVideo] == true) return;

    loadingThumbnails[urlVideo] = true;
    try {
      final thumbnail = await VideoThumbnail.thumbnailFile(
        video: urlVideo,
        thumbnailPath: (await getTemporaryDirectory()).path,
        imageFormat: ImageFormat.JPEG,
        maxHeight: 230,
        quality: 100,
      );
      thumbnailPaths[urlVideo] = thumbnail!;
    } catch (e) {
      e.toString();
    } finally {
      loadingThumbnails[urlVideo] = false;
    }
  }
}
