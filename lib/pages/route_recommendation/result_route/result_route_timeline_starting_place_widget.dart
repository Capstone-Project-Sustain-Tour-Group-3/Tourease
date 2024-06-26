import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:timeline_tile_nic/timeline_tile.dart';
import 'package:tourease/constants/color_constant.dart';
import 'package:tourease/constants/text_style_constant.dart';
import 'package:tourease/controllers/route_recommendation_controller.dart';

class ResultRouteTimelineStartingPlaceWidget extends StatelessWidget {
  ResultRouteTimelineStartingPlaceWidget({super.key});
  final RouteRecommendationController _routeRecomendationController =
      Get.put(RouteRecommendationController());

  @override
  Widget build(BuildContext context) {
    final lokasiAwal = _routeRecomendationController
        .routeResponseModel.value.data!.lokasiAwal!;
    return TimelineTile(
      isFirst: true,
      afterLineStyle: LineStyle(thickness: 5, color: ColorPrimary.primary100),
      axis: TimelineAxis.vertical,
      endChild: Padding(
        padding: const EdgeInsets.only(left: 62),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              decoration: BoxDecoration(
                color: ColorCollection.white,
                border: Border.all(
                  color: ColorNeutral.neutral200,
                  width: 1,
                ),
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(
                    color: ColorCollection.black.withOpacity(0.05),
                    offset: const Offset(0, 12),
                    blurRadius: 24,
                  ),
                ],
              ),
              width: 210,
              height: 300,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(12),
                    child: Padding(
                      padding: const EdgeInsets.all(3),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Container(
                          height: 190,
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                              colors: [
                                Colors.transparent,
                                Colors.black.withOpacity(0.3),
                              ],
                            ),
                          ),
                          child: GoogleMap(
                            onMapCreated:
                                _routeRecomendationController.onMapCreated,
                            initialCameraPosition: CameraPosition(
                              target: LatLng(
                                  lokasiAwal.latitude!, lokasiAwal.longitude!),
                              zoom: 14.0,
                            ),
                            markers: {
                              Marker(
                                markerId: const MarkerId('lokasiAwal'),
                                position: LatLng(lokasiAwal.latitude!,
                                    lokasiAwal.longitude!),
                              ),
                            },
                          ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 12),
                    child: Text(
                      lokasiAwal.nama!,
                      maxLines: 4,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyleCollection.captionBold.copyWith(
                        color: ColorNeutral.neutral800,
                        fontSize: 12,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      indicatorStyle: IndicatorStyle(
        width: 32,
        color: ColorPrimary.primary100,
        indicatorXY: 0.5,
        height: 32,
      ),
    );
  }
}
