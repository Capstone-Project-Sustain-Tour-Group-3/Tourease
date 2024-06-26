import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tourease/constants/color_constant.dart';
import 'package:tourease/constants/text_style_constant.dart';
import 'package:tourease/controllers/home_controller.dart';
import 'package:tourease/controllers/route_recommendation_controller.dart';
import 'package:tourease/controllers/search_city_destination_controller.dart';
import 'package:tourease/controllers/search_route_controller.dart';
import 'package:tourease/pages/route_recommendation/search_route/search_route_button_widget.dart';
import 'package:tourease/pages/route_recommendation/search_route/search_route_destination_container_widget.dart';
import 'package:tourease/pages/route_recommendation/search_route/search_route_list_view_widget.dart';

class SearchRoutePage extends StatelessWidget {
  final String id;
  SearchRoutePage({super.key, required this.id});

  final SearchRouteController searchRouteController =
      Get.put(SearchRouteController());

  final SearchCityDestinationController _searchCityDestinationController =
      Get.put(SearchCityDestinationController());

  final RouteRecommendationController _routeRecomendationController =
      Get.put(RouteRecommendationController());

  final HomeController _homeController = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      searchRouteController.getDestinationCities(id: id);
    });

    return Scaffold(
      backgroundColor: ColorNeutral.neutral50,
      appBar: AppBar(
        backgroundColor: ColorNeutral.neutral50,
        surfaceTintColor: ColorNeutral.neutral50,
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            searchRouteController.destinations.clear();
            Get.back();
          },
          icon: const Icon(Icons.arrow_back),
          color: ColorPrimary.primary500,
          iconSize: 24,
        ),
        title: AutoSizeText(
          'Masukkan Tujuan',
          style: TextStyleCollection.subtitleBold.copyWith(
            color: ColorNeutral.neutral900,
          ),
          minFontSize: 18,
          maxFontSize: 20,
        ),
      ),
      body: Stack(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(
                  left: 16,
                  top: 16,
                  right: 16,
                ),
                child: Obx(() => AutoSizeText(
                      _searchCityDestinationController.city.value,
                      style: TextStyleCollection.bodyBold
                          .copyWith(color: ColorNeutral.neutral900),
                      minFontSize: 18,
                      maxFontSize: 20,
                    )),
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: RouteDestinationContainerWidget(),
              ),
              // const SizedBox(height: 12),
              const Divider(),
              // const SizedBox(height: 8),
              const Expanded(child: RouteListWidget()),
              Obx(() {
                return SearchRouteButton(
                  isEnabled: searchRouteController.destinations.isNotEmpty,
                  onPressed: () {
                    _routeRecomendationController.postRouteRecommendation(
                      idKota: _searchCityDestinationController.id.value,
                      idDestinasiTujuan: searchRouteController.destinationIds,
                      namaLokasiAwal:
                          _homeController.savedCompletedCity.value ?? '',
                      latitude: _homeController.savedLatitude.value ?? 0,
                      longitude: _homeController.savedLongitude.value ?? 0,
                    );
                    _routeRecomendationController.namaKota.value =
                        _searchCityDestinationController.city.value;
                    searchRouteController.destinations.clear();
                  },
                );
              })
            ],
          ),
          Obx(
            () {
              if (_routeRecomendationController.isLoadingPostRoute.value) {
                return Container(
                  color: ColorNeutral.neutral50.withOpacity(0.5),
                  child: Center(
                    child: CircularProgressIndicator(
                      valueColor: AlwaysStoppedAnimation<Color>(
                        ColorPrimary.primary500,
                      ),
                    ),
                  ),
                );
              } else {
                return const SizedBox.shrink();
              }
            },
          ),
        ],
      ),
    );
  }
}
