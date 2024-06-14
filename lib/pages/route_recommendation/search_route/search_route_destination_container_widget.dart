import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tourease/constants/color_constant.dart';
import 'package:tourease/constants/text_style_constant.dart';
import 'package:tourease/controllers/home_controller.dart';
import 'package:tourease/controllers/search_route_controller.dart';

class RouteDestinationContainerWidget extends StatelessWidget {
  const RouteDestinationContainerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final SearchRouteController searchRouteController =
        Get.put(SearchRouteController());

    final HomeController homeController = Get.put(HomeController());

    return Card(
      elevation: 4,
      shadowColor: ColorCollection.black.withOpacity(0.80),
      color: ColorCollection.white,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
        child: Column(
          children: [
            SizedBox(
              height: 42,
              child: Row(
                children: [
                  Icon(
                    Icons.location_on_outlined,
                    color: ColorPrimary.primary500,
                    size: 24,
                  ),
                  // const SizedBox(width: 10),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: AutoSizeText(
                        homeController.savedCompletedCity.value ??
                            'Location unknwon',
                        style: TextStyleCollection.caption
                            .copyWith(color: ColorNeutral.neutral900),
                        minFontSize: 14,
                        maxFontSize: 16,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Divider(
              color: ColorNeutral.neutral500,
              indent: 31,
              endIndent: 12,
            ),
            Obx(
              () {
                return Column(
                  children: [
                    if (searchRouteController.destinations.isEmpty)
                      SizedBox(
                        height: 42,
                        child: Row(
                          children: [
                            Icon(
                              Icons.add_location_alt_outlined,
                              color: ColorPrimary.primary500,
                              size: 24,
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 10),
                              child: AutoSizeText(
                                'Lokasi Tujuan',
                                style: TextStyleCollection.caption
                                    .copyWith(color: ColorNeutral.neutral400),
                                minFontSize: 14,
                                maxFontSize: 16,
                              ),
                            ),
                          ],
                        ),
                      )
                    else
                      ...searchRouteController.destinations
                          .map((destination) {
                        return SizedBox(
                          height: 44,
                          child: Row(
                            children: [
                              Icon(
                                Icons.verified,
                                color: ColorPrimary.primary500,
                                size: 24,
                              ),
                              const SizedBox(width: 10),
                              Expanded(
                                child: AutoSizeText(
                                  destination.name,
                                  style: TextStyleCollection.caption
                                      .copyWith(color: ColorNeutral.neutral900),
                                  minFontSize: 14,
                                  maxFontSize: 16,
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                              IconButton(
                                icon: Icon(
                                  Icons.remove_circle_outline_rounded,
                                  color: ColorDanger.danger400,
                                  size: 24,
                                ),
                                onPressed: () => searchRouteController
                                    .removeDestination(destination),
                              ),
                            ],
                          ),
                        );
                      }),
                  ],
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
