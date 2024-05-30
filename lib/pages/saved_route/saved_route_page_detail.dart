import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tourease/constants/color_constant.dart';
import 'package:tourease/constants/text_style_constant.dart';
import 'package:tourease/controllers/saved_route_controller.dart';
import 'package:tourease/pages/saved_route/saved_route_widget_detail_list_view.dart';

class SavedRouteDetailPage extends StatelessWidget {
  const SavedRouteDetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    final SavedRouteController savedRouteController =
        Get.find<SavedRouteController>();
    savedRouteController.calculateTotalCost();
    // variable hitung total cost?

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
      ),
      body: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AutoSizeText(
                  savedRouteController.selectedRouteTitle.value,
                  style: TextStyleCollection.bodyBold
                      .copyWith(color: ColorPrimary.primary700),
                  minFontSize: 18,
                  maxFontSize: 20,
                ),
                const SizedBox(height: 16),
                Expanded(
                  child: SavedRouteDetailListView(),
                ),
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
                        // 'Rp. ${savedRouteController.totalCost.value.toStringAsFixed(0)}',
                        savedRouteController.totalCostString.value,
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
      ),
    );
  }
}
