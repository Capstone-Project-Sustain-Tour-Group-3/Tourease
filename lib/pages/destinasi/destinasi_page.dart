import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:tourease/constants/assets_constant.dart';
import 'package:tourease/constants/color_constant.dart';
import 'package:tourease/constants/status_bar_constant.dart';
import 'package:tourease/constants/text_style_constant.dart';
import 'package:tourease/controllers/destinasi_controller.dart';
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
                if (destinasiController.kategoriPilihan.isEmpty) {
                  return Center(
                    child: SingleChildScrollView(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SvgPicture.asset(
                            AssetsCollection.registerFailed,
                          ),
                          const SizedBox(
                            height: 31,
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 15),
                            child: Column(
                              children: [
                                AutoSizeText(
                                  'Oops, belum ada hasil nih!',
                                  style: TextStyleCollection.bodyBold.copyWith(
                                    color: ColorPrimary.primary900,
                                  ),
                                  minFontSize: 16,
                                  maxFontSize: 18,
                                  textAlign: TextAlign.center,
                                ),
                                const SizedBox(
                                  height: 16,
                                ),
                                AutoSizeText(
                                  'Coba deh ketik kata kunci lain atau periksa lagi ejaannya. Kami yakin kamu akan menemukan yang kamu cari!',
                                  style: TextStyleCollection.caption.copyWith(
                                    color: ColorPrimary.primary900,
                                  ),
                                  minFontSize: 14,
                                  maxFontSize: 16,
                                  textAlign: TextAlign.center,
                                ),
                                const SizedBox(
                                  height: 24,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
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
