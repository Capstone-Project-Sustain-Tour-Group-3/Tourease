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

  DateTime convertTimeStringToDateTime(String time) {
    final timeParts = time.split(':');
    final hours = int.parse(timeParts[0]);
    final minutes = int.parse(timeParts[1]);
    return DateTime(DateTime.now().year, DateTime.now().month,
        DateTime.now().day, hours, minutes);
  }

  String formatDuration(Duration duration) {
    String twoDigits(int n) {
      if (n >= 10) return "$n";
      return "0$n";
    }

    String twoDigitMinutes = twoDigits(duration.inMinutes.remainder(60));
    return "${twoDigits(duration.inHours)}j${twoDigitMinutes}m";
  }

  @override
  Widget build(BuildContext context) {
    StatusBarConstant.statusBar;

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
                  Navigator.pop(context);
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
                const CityNameWidget(),
                Padding(
                  padding: const EdgeInsets.only(left: 32),
                  child: Column(
                    children: [
                      TimelineStartingPlaceWidget(
                          lokasiAwal: _routeRecomendationController
                              .routeResponseModel
                              .value
                              .data!
                              .lokasiAwal!
                              .nama!),
                      for (var i = 0;
                          i <
                              _routeRecomendationController.routeResponseModel
                                  .value.data!.detailRute!.length;
                          i++)
                        TimelineRouteWidget(
                          id: _routeRecomendationController.routeResponseModel
                              .value.data!.detailRute![i].destinasi!.id!,
                          waktuPerjalanan: _routeRecomendationController
                              .routeResponseModel
                              .value
                              .data!
                              .detailRute![i]
                              .durasi!
                              .simple!
                              .toString(),
                          isLast: i ==
                              _routeRecomendationController.routeResponseModel
                                      .value.data!.detailRute!.length -
                                  1,
                          destinationLength: i + 1,
                          urlGambar: _routeRecomendationController
                              .routeResponseModel
                              .value
                              .data!
                              .detailRute![i]
                              .destinasi!
                              .urlGambar!,
                          namaDestinasi: _routeRecomendationController
                              .routeResponseModel
                              .value
                              .data!
                              .detailRute![i]
                              .destinasi!
                              .nama!,
                          waktuKunjungan: _routeRecomendationController
                              .routeResponseModel
                              .value
                              .data!
                              .detailRute![i]
                              .waktuKunjungan!,
                          waktuSelesai: _routeRecomendationController
                              .routeResponseModel
                              .value
                              .data!
                              .detailRute![i]
                              .waktuSelesai!,
                          biaya: _routeRecomendationController
                              .routeResponseModel
                              .value
                              .data!
                              .detailRute![i]
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
          FooterSaveRouteWidget(
            fullBiaya: _routeRecomendationController.calculateFullBiaya(),
          ),
        ],
      ),
    );
  }
}
