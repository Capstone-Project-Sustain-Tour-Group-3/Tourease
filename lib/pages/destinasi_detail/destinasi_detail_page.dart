import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tourease/constants/color_constant.dart';
import 'package:tourease/constants/status_bar_constant.dart';
import 'package:tourease/constants/text_style_constant.dart';
import 'package:tourease/pages/destinasi_detail/destinasi_detail_carousel.dart';
import 'package:tourease/pages/destinasi_detail/destinasi_detail_deskripsi.dart';
import 'package:tourease/pages/destinasi_detail/destinasi_detail_destinasi_serupa.dart';
import 'package:tourease/pages/destinasi_detail/destinasi_detail_fasilitas.dart';
import 'package:tourease/pages/destinasi_detail/destinasi_detail_title.dart';
import 'package:tourease/pages/destinasi_detail/destinasi_detail_video_list.dart';

class DestinasiDetailPage extends StatelessWidget {
  const DestinasiDetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    StatusBarConstant.statusBar;

    return Scaffold(
      backgroundColor: ColorNeutral.neutral50,
      appBar: AppBar(
        backgroundColor: ColorNeutral.neutral50,
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
          'Detail',
          style: TextStyleCollection.subtitleBold.copyWith(
            color: ColorNeutral.neutral900,
          ),
          minFontSize: 16,
          maxFontSize: 18,
        ),
        centerTitle: true,
      ),
      body: const SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            DetailDestinasiCarousel(), // Make sure this widget is properly defined
            Padding(
              padding: EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TitleSectionWidget(),
                  SizedBox(height: 16),
                  DestinasiDetailDeskripsi(),
                  SizedBox(height: 16),
                  DestinasiDetailFasilitas(),
                  SizedBox(height: 16),
                  DestinasiDetailVideoList(),
                  SizedBox(height: 16),
                  DestinasiDetailDestinasiSerupa()
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
