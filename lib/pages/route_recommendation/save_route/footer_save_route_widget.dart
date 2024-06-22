import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tourease/constants/color_constant.dart';
import 'package:tourease/constants/text_style_constant.dart';
import 'package:tourease/controllers/route_recommendation_controller.dart';
import 'package:tourease/controllers/search_city_destination_controller.dart';
import 'package:tourease/widgets/button_widget.dart';
import 'package:tourease/model/save_route_request_model.dart';
import 'package:tourease/widgets/snackbar_widget.dart';

class FooterSaveRouteWidget extends StatelessWidget {
  final String fullBiaya;

  FooterSaveRouteWidget({
    super.key,
    required this.fullBiaya,
  });

  final TextEditingController _routeNameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final RouteRecommendationController routeRecommendationController =
        Get.put(RouteRecommendationController());

    final SearchCityDestinationController searchCityDestinationController =
        Get.put(SearchCityDestinationController());
    routeRecommendationController.resetRouteSaved();

    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        decoration: BoxDecoration(
          color: ColorCollection.white,
          boxShadow: [
            BoxShadow(
              color: ColorCollection.black.withOpacity(0.1),
              blurRadius: 16,
              offset: const Offset(0, -8),
            ),
          ],
        ),
        height: 96,
        width: double.infinity,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 16, top: 16, bottom: 24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Estimasi Biaya',
                    style: TextStyleCollection.caption
                        .copyWith(color: ColorNeutral.neutral900, fontSize: 14),
                  ),
                  Text(
                    fullBiaya,
                    style: TextStyleCollection.bodyBold
                        .copyWith(color: ColorPrimary.primary900, fontSize: 16),
                  ),
                ],
              ),
            ),
            const Spacer(),
            Obx(() {
              return Visibility(
                visible: !routeRecommendationController.isRouteSaved.value,
                child: GestureDetector(
                  onTap: () {
                    Get.dialog(
                      Dialog(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                          side: BorderSide(
                            color: ColorNeutral.neutral50,
                          ),
                        ),
                        backgroundColor: ColorNeutral.neutral50,
                        elevation: 16,
                        shadowColor: const Color(0xFF000000).withOpacity(0.1),
                        child: Container(
                          color: ColorNeutral.neutral50,
                          height: 240,
                          padding: const EdgeInsets.all(16),
                          child: Column(
                            children: [
                              const SizedBox(height: 12),
                              Text(
                                "Simpan Rute Perjalanan",
                                style: TextStyleCollection.bodyBold.copyWith(
                                  fontSize: 16,
                                  color: ColorNeutral.neutral900,
                                ),
                              ),
                              const SizedBox(height: 24),
                              Container(
                                height: 48,
                                width: double.infinity,
                                alignment: Alignment.center,
                                padding: const EdgeInsets.only(
                                    left: 16, bottom: 12, top: 4),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(4),
                                  border: Border.all(
                                    color: ColorNeutral.neutral200,
                                    width: 1,
                                  ),
                                ),
                                child: TextField(
                                  controller: _routeNameController,
                                  decoration: InputDecoration(
                                    suffixIcon: IconButton(
                                      icon: Icon(
                                        Icons.highlight_remove,
                                        color: ColorNeutral.neutral500,
                                      ),
                                      onPressed: () {
                                        _routeNameController.clear();
                                      },
                                    ),
                                    hintText: 'Masukkan nama rute ...',
                                    hintStyle: TextStyleCollection.caption
                                        .copyWith(
                                            color: ColorNeutral.neutral700,
                                            fontSize: 14),
                                    border: InputBorder.none,
                                  ),
                                ),
                              ),
                              const SizedBox(height: 24),
                              SizedBox(
                                width: double.infinity,
                                height: 48,
                                child: ButtonWidget(
                                  onPressed: () async {
                                    final saveRouteRequest =
                                        SaveRouteRequestModel(
                                      cityId: searchCityDestinationController
                                          .id.value,
                                      name: _routeNameController.text,
                                      startLocation:
                                          routeRecommendationController
                                              .routeResponseModel
                                              .value
                                              .data!
                                              .lokasiAwal!
                                              .nama!,
                                      startLongitude:
                                          routeRecommendationController
                                              .routeResponseModel
                                              .value
                                              .data!
                                              .lokasiAwal!
                                              .longitude!,
                                      startLatitude:
                                          routeRecommendationController
                                              .routeResponseModel
                                              .value
                                              .data!
                                              .lokasiAwal!
                                              .latitude!,
                                      price: int.parse(fullBiaya.replaceAll(
                                          RegExp(r'[^0-9]'), '')),
                                      routeDetails:
                                          routeRecommendationController
                                              .routeResponseModel
                                              .value
                                              .data!
                                              .detailRute!
                                              .map((detail) {
                                        return RouteDetail(
                                          destinationId: detail.destinasi!.id!,
                                          longitude:
                                              detail.destinasi!.longitude!,
                                          latitude: detail.destinasi!.latitude!,
                                          duration: detail.durasi!.raw!,
                                          order: detail.urutan!,
                                          visitStart: detail.waktuKunjungan!,
                                          visitEnd: detail.waktuSelesai!,
                                        );
                                      }).toList(),
                                    );

                                    final isSuccess =
                                        await routeRecommendationController
                                            .saveRoute(saveRouteRequest);

                                    Get.back();

                                    if (isSuccess) {
                                      SnackbarWidget.showSnackbar(
                                        message: 'Rute berhasil disimpan',
                                        backgroundColor: ColorNeutral.neutral50,
                                        textColor: ColorNeutral.neutral700,
                                        textContainerColor:
                                            ColorNeutral.neutral50,
                                      );
                                    }
                                  },
                                  text: 'Simpan',
                                  textColor: ColorNeutral.neutral100,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                  child: Padding(
                    padding:
                        const EdgeInsets.only(top: 16, right: 16, bottom: 24),
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: ColorPrimary.primary700,
                          width: 1,
                        ),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      height: 48,
                      width: 157,
                      child: Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: 12, horizontal: 16),
                            child: Icon(
                              Icons.bookmark_border,
                              color: ColorPrimary.primary500,
                            ),
                          ),
                          Text(
                            'Simpan Rute',
                            style: TextStyleCollection.captionMedium.copyWith(
                                color: ColorPrimary.primary500, fontSize: 14),
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              );
            }),
          ],
        ),
      ),
    );
  }
}
