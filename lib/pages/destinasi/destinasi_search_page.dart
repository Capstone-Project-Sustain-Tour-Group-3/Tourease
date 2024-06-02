import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:tourease/constants/assets_constant.dart';
import 'package:tourease/constants/color_constant.dart';
import 'package:tourease/constants/status_bar_constant.dart';
import 'package:tourease/constants/text_style_constant.dart';
import 'package:tourease/controllers/bottom_navbar_controller.dart';
import 'package:tourease/controllers/destinasi_controller.dart';
import 'package:tourease/pages/bottom_navbar/bottom_navbar.dart';
import 'package:tourease/widgets/search_text_form_field_widget.dart';

class DestinasiSearchPage extends StatelessWidget {
  const DestinasiSearchPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final DestinasiController destinasiController = Get.put(
      DestinasiController(),
    );

    final BottomNavbarController bottomNavbarController = Get.put(
      BottomNavbarController(),
    );

    StatusBarConstant.statusBar;

    return Scaffold(
      backgroundColor: ColorNeutral.neutral50,
      appBar: AppBar(
        backgroundColor: ColorNeutral.neutral50,
        surfaceTintColor: ColorNeutral.neutral50,
        leading: IconButton(
          onPressed: () {
            if (destinasiController.destinasiController.text == '') {
              bottomNavbarController.updateSearchText('');
              Get.to(() => const BottomNavbar(initialIndex: 1));
              destinasiController.destinasiController.clear();
              destinasiController.searchDestinasiController.clear();
            } else {
              Get.back();
            }
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
            child: SearchTextFormFieldWidget(
              controller: destinasiController.searchDestinasiController,
              onFieldSubmitted: (value) {
                if (value.isNotEmpty) {
                  destinasiController.saveSearchHistory(value);
                  destinasiController.searchDestinasiController.clear();
                  bottomNavbarController.updateSearchText(value);
                  Get.off(
                    () => const BottomNavbar(
                      initialIndex: 1,
                    ),
                  );
                }
              },
              autofocus: true,
              cursorColor: ColorNeutral.neutral900,
              hintTextColor: ColorNeutral.neutral600,
              enabledBorderColor: ColorNeutral.neutral200,
              focusedBorderColor: ColorNeutral.neutral500,
              prefixIcon: Icon(
                Icons.search,
                color: ColorNeutral.neutral500,
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
                                    return GestureDetector(
                                      onTap: () {
                                        bottomNavbarController.updateSearchText(
                                          destinasiController
                                              .searchHistory[index],
                                        );
                                        Get.off(
                                          () => const BottomNavbar(
                                            initialIndex: 1,
                                          ),
                                        );
                                      },
                                      child: Row(
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
                                            style: TextStyleCollection
                                                .bodyMedium
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
                                      ),
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
