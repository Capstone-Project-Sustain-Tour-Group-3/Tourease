import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:tourease/constants/color_constant.dart';
import 'package:tourease/constants/text_style_constant.dart';
import 'package:tourease/pages/home/home_container_destinasi_populer.dart';

class HomeListDestinasiPopuler extends StatelessWidget {
  const HomeListDestinasiPopuler({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AutoSizeText(
            'Destinasi Populer',
            style: TextStyleCollection.subtitleBold.copyWith(
              color: ColorPrimary.primary700,
            ),
            minFontSize: 18,
            maxFontSize: 20,
          ),
          const SizedBox(
            height: 16,
          ),
          Container(
            height: 230,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
            ),
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: 5,
              itemBuilder: (context, index) {
                return const Padding(
                  padding: EdgeInsets.only(right: 8),
                  child: HomeContainerDestinasiPopuler(
                    url:
                        'https://videos.pexels.com/video-files/20770858/20770858-hd_1080_1920_30fps.mp4',
                    deskripsiVideo:
                        'Membatik dan belajar sejarah keraton di museum Ullen Sentalu',
                  ),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
