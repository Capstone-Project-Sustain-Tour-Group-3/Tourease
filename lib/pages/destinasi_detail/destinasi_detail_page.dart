import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tourease/constants/color_constant.dart';
import 'package:tourease/constants/status_bar_constant.dart';
import 'package:tourease/constants/text_style_constant.dart';
import 'package:tourease/controllers/destinasi_controller.dart';
import 'package:tourease/controllers/detail_destinasi_controller.dart';
import 'package:tourease/pages/destinasi_detail/destinasi_detail_carousel.dart';
import 'package:tourease/pages/destinasi_detail/destinasi_detail_deskripsi.dart';
import 'package:tourease/pages/destinasi_detail/destinasi_detail_destinasi_serupa.dart';
import 'package:tourease/pages/destinasi_detail/destinasi_detail_fasilitas.dart';
import 'package:tourease/pages/destinasi_detail/destinasi_detail_title.dart';
import 'package:tourease/pages/destinasi_detail/destinasi_detail_video_list.dart';

class DestinasiDetailPage extends StatelessWidget {
  const DestinasiDetailPage({
    super.key,
    required this.id,
  });

  final String id;

  @override
  Widget build(BuildContext context) {
    StatusBarConstant.statusBar;

    final DetailDestinasiController controller =
        Get.put(DetailDestinasiController());

    final DestinasiController destinasiController = Get.put(
      DestinasiController(),
    );

    WidgetsBinding.instance.addPostFrameCallback((_) {
      controller.getDetailDestinasi(id: id);
    });

    return Scaffold(
      backgroundColor: ColorNeutral.neutral50,
      appBar: AppBar(
        surfaceTintColor: ColorNeutral.neutral50,
        backgroundColor: ColorNeutral.neutral50,
        leading: IconButton(
          onPressed: () {
            Get.back();
            destinasiController.searchDestinasi();
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
      body: Obx(
        () => controller.isLoadingDetailDestinasi.value
            ? Center(
                child: SizedBox(
                  width: 50,
                  height: 50,
                  child: CircularProgressIndicator(
                    color: ColorPrimary.primary500,
                  ),
                ),
              )
            : SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const DetailDestinasiCarousel(), // Make sure this widget is properly defined
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          TitleSectionWidget(
                            title: controller.detailDestinasi.value.data
                                    ?.namaDestinasi ??
                                '',
                            view: controller
                                    .detailDestinasi.value.data?.visitCount
                                    .toString() ??
                                '',
                            location:
                                '${controller.detailDestinasi.value.data?.alamatDestinasi?.namaJalan}, ${controller.detailDestinasi.value.data?.alamatDestinasi?.kecamatan}, ${controller.capitalizeEachWord(controller.detailDestinasi.value.data?.alamatDestinasi?.kota ?? '')}, ${controller.capitalizeEachWord(controller.detailDestinasi.value.data?.alamatDestinasi?.provinsi ?? '')} \n${controller.detailDestinasi.value.data?.alamatDestinasi?.kodePos}',
                            time:
                                '${controller.detailDestinasi.value.data?.jamBuka} - ${controller.detailDestinasi.value.data?.jamTutup}',
                            price:
                                '${controller.detailDestinasi.value.data?.hargaMasuk ?? ''}',
                            category: controller.detailDestinasi.value.data
                                    ?.kategori?.nama ??
                                '',
                          ),
                          const SizedBox(height: 16),
                          DestinasiDetailDeskripsi(
                            description: controller
                                    .detailDestinasi.value.data?.deskripsi ??
                                '',
                          ),
                          const SizedBox(height: 16),
                          const DestinasiDetailFasilitas(),
                          const SizedBox(height: 16),
                          const DestinasiDetailVideoList(),
                          const SizedBox(height: 16),
                          const DestinasiDetailDestinasiSerupa()
                        ],
                      ),
                    ),
                  ],
                ),
              ),
      ),
    );
  }
}
