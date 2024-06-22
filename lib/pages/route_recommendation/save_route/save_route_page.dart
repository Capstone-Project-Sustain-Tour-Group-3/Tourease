import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tourease/constants/color_constant.dart';
import 'package:tourease/constants/status_bar_constant.dart';
import 'package:tourease/constants/text_style_constant.dart';
import 'package:tourease/controllers/route_recommendation_controller.dart';
import 'package:tourease/pages/route_recommendation/save_route/city_name_widget.dart';
import 'package:tourease/pages/route_recommendation/save_route/footer_save_route_widget.dart';
import 'package:tourease/pages/route_recommendation/save_route/timeline_route_widget.dart';
import 'package:tourease/pages/route_recommendation/save_route/timeline_starting_place_widget.dart';

class SaveRoutePage extends StatelessWidget {
  SaveRoutePage({super.key});
  final RouteRecommendationController _routeRecomendationController =
      Get.put(RouteRecommendationController());

  @override
  Widget build(BuildContext context) {
    StatusBarConstant.statusBar;

    final detailRute = _routeRecomendationController
        .routeResponseModel.value.data!.detailRute!;

    return Scaffold(
      backgroundColor: ColorNeutral.neutral50,
      appBar: AppBar(
        backgroundColor: ColorNeutral.neutral50,
        surfaceTintColor: ColorNeutral.neutral50,
        centerTitle: true,
        title: Text(
          textAlign: TextAlign.center,
          'Rute Perjalanan',
          style: TextStyleCollection.subtitleBold.copyWith(
            color: ColorNeutral.neutral900,
            fontSize: 18,
          ),
        ),
        leading: Row(
          children: [
            const SizedBox(width: 6),
            IconButton(
                onPressed: () {
                  Get.back();
                },
                icon: Icon(
                  Icons.arrow_back,
                  color: ColorPrimary.primary500,
                  size: 24,
                )),
          ],
        ),
      ),
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CityNameWidget(),
                Padding(
                  padding: const EdgeInsets.only(left: 32),
                  child: Column(
                    children: [
                      TimelineStartingPlaceWidget(),
                      for (var i = 0; i < detailRute.length; i++)
                        TimelineRouteWidget(
                          id: detailRute[i].destinasi!.id!,
                          waktuPerjalanan:
                              detailRute[i].durasi!.simple!.toString(),
                          isLast: i == detailRute.length - 1,
                          destinationLength: i + 1,
                          urlGambar: detailRute[i].destinasi!.urlGambar!,
                          namaDestinasi: detailRute[i].destinasi!.nama!,
                          waktuKunjungan: detailRute[i].waktuKunjungan!,
                          waktuSelesai: detailRute[i].waktuSelesai!,
                          biaya: detailRute[i]
                              .destinasi!
                              .biayaMasuk!
                              .format
                              .toString(),
                        ),
                      const SizedBox(height: 126),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              FooterSaveRouteWidget(
                fullBiaya: _routeRecomendationController
                    .routeResponseModel.value.data!.estimasiBiaya!.format
                    .toString(),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
