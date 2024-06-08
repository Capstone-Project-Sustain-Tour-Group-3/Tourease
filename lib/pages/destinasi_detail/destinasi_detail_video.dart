import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tourease/constants/color_constant.dart';
import 'package:tourease/constants/text_style_constant.dart';
import 'package:tourease/pages/video_content/video_content_page.dart';
import 'package:tourease/widgets/cached_network_image_widget.dart';

class DestinasiDetailVideo extends StatelessWidget {
  const DestinasiDetailVideo({super.key});

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImageWidget(
      imageUrl:
          'https://s3-alpha-sig.figma.com/img/8b71/d612/1462764859a40b4bf08ffd03d00de77a?Expires=1717977600&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4&Signature=AqG0QVBukwgASiKoQZOUmHZkViK3ASruK7WyGdglCEWUC6nbrQXUHMSBG1nAhMGZuNPY5uaf8MQihJMS6ysd~shV71gREJGtNHZYMU1O85rQWxlzotNX4BzwHc0hM2UV0lnjyL1s8nDtwCUv~DEgKJKCm0~qh3g6m3VNtd1GnOgg3Lk0jJua51yoskjuZY5O8B4pp~raNqBFFyzf5V6vwp-IiQ6RnaL3GrfCigo11o0IvsovlMntpxnleGSyFL9vxGRJJrfN5FRrtX4JsQ61DBKZsBjr3GwBauDwbKFvWQXZsExuIPOgwrQMOTzr7jVq2gr3s6QhP22KTaIZbMKsAw__',
      imageBuilder: (context, imageProvider) => Container(
        width: 142,
        height: 230,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          image: DecorationImage(
            image: imageProvider,
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
                  Get.to(() => const VideoContentPage());
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
                  'Ternyata Ada Hutan Bawah Tanah di Gua Jomblang',
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
      ),
    );
  }
}
