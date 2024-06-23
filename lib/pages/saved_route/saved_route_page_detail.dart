import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tourease/constants/color_constant.dart';
import 'package:tourease/constants/text_style_constant.dart';
import 'package:tourease/controllers/saved_route_controller.dart';
import 'package:tourease/pages/saved_route/saved_route_widget_detail_list_view.dart';

class SavedRouteDetailPage extends StatelessWidget {
  const SavedRouteDetailPage({
    super.key,
    required this.id,
  });

  final String id;
  @override
  Widget build(BuildContext context) {
    final SavedRouteController savedRouteController =
        Get.put(SavedRouteController());

    WidgetsBinding.instance.addPostFrameCallback((_) {
      savedRouteController.getDetailRoute(id: id);
    });

    return Scaffold(
      backgroundColor: ColorNeutral.neutral50,
      appBar: AppBar(
        backgroundColor: ColorNeutral.neutral50,
        surfaceTintColor: ColorNeutral.neutral50,
        title: AutoSizeText(
          'Detail Rute',
          style: TextStyleCollection.bodyBold,
          minFontSize: 18,
          maxFontSize: 20,
        ),
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: Icon(
            Icons.arrow_back,
            color: ColorPrimary.primary500,
          ),
        ),
      ),
      body: Obx(
        () {
          if (savedRouteController.isLoadingDetailRoute.value) {
            return Center(
              child: CircularProgressIndicator(
                color: ColorPrimary.primary500,
              ),
            );
          } else {
            return Stack(
              children: [
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Obx(
                        () => AutoSizeText(
                          savedRouteController
                                  .detailRoute.value.data?.namaRute ??
                              '',
                          style: TextStyleCollection.bodyBold
                              .copyWith(color: ColorPrimary.primary700),
                          minFontSize: 18,
                          maxFontSize: 20,
                        ),
                      ),
                      const SizedBox(height: 16),
                      Text(
                        'Lokasi Awal',
                        style: TextStyleCollection.captionBold.copyWith(
                          color: ColorNeutral.neutral500,
                          fontSize: 12,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Obx(
                        () => Text(
                          savedRouteController
                                  .detailRoute.value.data?.lokasiAwal ??
                              '',
                          style: TextStyleCollection.caption.copyWith(
                            color: ColorNeutral.neutral900,
                            fontSize: 12,
                          ),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      const SizedBox(height: 16),
                      Text(
                        'Destinasi Tujuan',
                        style: TextStyleCollection.captionBold.copyWith(
                          color: ColorNeutral.neutral500,
                          fontSize: 12,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Expanded(
                        child: SavedRouteDetailListView(
                          id: id,
                        ),
                      ),
                      const SizedBox(height: 109),
                    ],
                  ),
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Obx(
                    () {
                      return Container(
                        width: double.infinity,
                        height: 109,
                        decoration: BoxDecoration(
                          color: ColorNeutral.neutral50,
                          borderRadius: BorderRadius.circular(12),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.1),
                              blurRadius: 24,
                              offset: const Offset(0, -12),
                            ),
                          ],
                        ),
                        padding: const EdgeInsets.only(
                          left: 24,
                          top: 16,
                          right: 24,
                          bottom: 46,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            AutoSizeText(
                              'Estimasi Biaya',
                              style: TextStyleCollection.captionMedium
                                  .copyWith(color: ColorNeutral.neutral900),
                              minFontSize: 14,
                              maxFontSize: 16,
                            ),
                            AutoSizeText(
                              savedRouteController.formatRupiah(
                                  savedRouteController.detailRoute.value.data
                                          ?.estimasiBiaya ??
                                      0),
                              style: TextStyleCollection.bodyBold
                                  .copyWith(color: ColorDanger.danger500),
                              minFontSize: 18,
                              maxFontSize: 20,
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),
              ],
            );
          }
        },
      ),
    );
  }
}
