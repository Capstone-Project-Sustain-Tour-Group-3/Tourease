import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tourease/constants/color_constant.dart';
import 'package:tourease/constants/status_bar_constant.dart';
import 'package:tourease/constants/text_style_constant.dart';
import 'package:tourease/controllers/destinasi_controller.dart';
import 'package:tourease/pages/destinasi/destinai_zero_result.dart';
import 'package:tourease/pages/destinasi/destinasi_card.dart';
import 'package:tourease/pages/destinasi/destinasi_search_and_filter.dart';

class DestinasiPage extends StatelessWidget {
  const DestinasiPage({
    super.key,
    this.searchText,
  });

  final String? searchText;

  @override
  Widget build(BuildContext context) {
    StatusBarConstant.statusBar;

    final DestinasiController destinasiController = Get.put(
      DestinasiController(),
    );

    WidgetsBinding.instance.addPostFrameCallback((_) {
      destinasiController.destinasiController.text = searchText ?? '';
      destinasiController.searchDestinasi(
        search: searchText,
        sort: destinasiController.urutanPilihan.value,
        filter: destinasiController.kategoriPilihan.value,
      );
    });

    return Scaffold(
      backgroundColor: ColorNeutral.neutral50,
      body: Column(
        children: [
          const SizedBox(
            height: 8,
          ),
          Center(
            child: SafeArea(
              child: AutoSizeText(
                'Destinasi',
                style: TextStyleCollection.subtitleBold.copyWith(
                  color: ColorNeutral.neutral900,
                ),
                minFontSize: 18,
                maxFontSize: 20,
              ),
            ),
          ),
          const SizedBox(
            height: 24,
          ),
          DestinasiSearchAndFilter(
            searchText: searchText,
          ),
          const SizedBox(
            height: 24,
          ),
          Expanded(
            child: Obx(
              () {
                if (destinasiController.isLoadingSearchDestinasi.value) {
                  return Center(
                    child: SizedBox(
                      height: 50,
                      width: 50,
                      child: CircularProgressIndicator(
                        color: ColorPrimary.primary500,
                      ),
                    ),
                  );
                } else if (destinasiController.destinasiResponse.value.data ==
                        null ||
                    destinasiController.destinasiResponse.value.data!.isEmpty ||
                    destinasiController.destinasiResponse.value.status ==
                        'failed') {
                  return const DestinaiZeroResult();
                } else {
                  return const DestinasiCard();
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
