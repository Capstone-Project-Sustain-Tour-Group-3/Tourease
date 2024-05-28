import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:tourease/constants/assets_constant.dart';
import 'package:tourease/constants/color_constant.dart';
import 'package:tourease/constants/text_style_constant.dart';
import 'package:tourease/controllers/destinasi_controller.dart';

class DestinasiSearchPage extends StatelessWidget {
  const DestinasiSearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    final DestinasiController destinasiController = Get.put(
      DestinasiController(),
    );

    return Scaffold(
      appBar: AppBar(
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
          'Pencarian',
          style: TextStyleCollection.subtitleBold.copyWith(
            color: ColorPrimary.primary900,
          ),
          minFontSize: 18,
          maxFontSize: 20,
        ),
        centerTitle: true,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(
            height: 20,
          ),
          Container(
            width: double.infinity,
            margin: const EdgeInsets.symmetric(horizontal: 16),
            child: TextFormField(
              onFieldSubmitted: (value) {
                if (value.isNotEmpty) {
                  destinasiController.saveSearchHistory(value);
                }
              },
              autofocus: true,
              style: TextStyleCollection.caption.copyWith(
                color: ColorNeutral.neutral900,
                fontSize: 14,
              ),
              cursorColor: ColorNeutral.neutral900,
              decoration: InputDecoration(
                prefixIcon: Icon(
                  Icons.search,
                  color: ColorNeutral.neutral500,
                ),
                hintText: 'Cari destinasi...',
                hintStyle: TextStyleCollection.caption.copyWith(
                  color: ColorNeutral.neutral600,
                  fontSize: 14,
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide(
                    color: ColorNeutral.neutral200,
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide(
                    color: ColorNeutral.neutral500,
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Obx(
                () => Column(
                  children: [
                    destinasiController.searchHistory.isNotEmpty
                        ? Container(
                            width: double.infinity,
                            margin: const EdgeInsets.symmetric(horizontal: 16),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                AutoSizeText(
                                  'Riwayat Terbaru',
                                  style:
                                      TextStyleCollection.subtitleBold.copyWith(
                                    color: ColorPrimary.primary700,
                                  ),
                                  minFontSize: 18,
                                  maxFontSize: 20,
                                ),
                                const SizedBox(
                                  height: 12,
                                ),
                                ListView.builder(
                                  shrinkWrap: true,
                                  itemCount:
                                      destinasiController.searchHistory.length,
                                  itemBuilder: (context, index) {
                                    return Row(
                                      children: [
                                        Icon(
                                          Icons.history,
                                          color: ColorNeutral.neutral900,
                                        ),
                                        const SizedBox(
                                          width: 12,
                                        ),
                                        AutoSizeText(
                                          destinasiController
                                              .searchHistory[index],
                                          style: TextStyleCollection.bodyMedium
                                              .copyWith(
                                            color: ColorNeutral.neutral900,
                                          ),
                                          minFontSize: 16,
                                          maxFontSize: 16,
                                        ),
                                        const Spacer(),
                                        IconButton(
                                          onPressed: () {
                                            destinasiController
                                                .deleteSearchHistory(index);
                                          },
                                          icon: Icon(
                                            Icons.close,
                                            color: ColorNeutral.neutral900,
                                          ),
                                        )
                                      ],
                                    );
                                  },
                                ),
                              ],
                            ),
                          )
                        : Column(
                            children: [
                              const SizedBox(
                                height: 120,
                              ),
                              Container(
                                width: double.infinity,
                                margin: const EdgeInsets.symmetric(
                                  horizontal: 16,
                                ),
                                child: Column(
                                  children: [
                                    SvgPicture.asset(
                                      AssetsCollection.onboarding1,
                                      height: 150,
                                    ),
                                    const SizedBox(
                                      height: 40,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 16),
                                      child: AutoSizeText(
                                        'Temukan destinasi impianmu! ',
                                        style: TextStyleCollection.bodyBold
                                            .copyWith(
                                          color: ColorNeutral.neutral900,
                                        ),
                                        minFontSize: 16,
                                        maxFontSize: 18,
                                        textAlign: TextAlign.center,
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 8,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 8),
                                      child: AutoSizeText(
                                        'Gunakan fitur pencarian kami, ketik kata kunci yang relevan, dan tekan Enter untuk mulai petualanganmu.',
                                        style: TextStyleCollection.caption
                                            .copyWith(
                                          color: ColorNeutral.neutral700,
                                        ),
                                        minFontSize: 13,
                                        maxFontSize: 15,
                                        textAlign: TextAlign.center,
                                        maxLines: 2,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
