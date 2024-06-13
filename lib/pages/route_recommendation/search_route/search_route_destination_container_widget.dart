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
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: Column(
            children: [
              Row(
                children: [
                  Icon(
                    Icons.location_on_outlined,
                    color: ColorPrimary.primary500,
                    size: 24,
                  ),
                  const SizedBox(width: 10),
                  AutoSizeText(
                    homeController.savedCity.value ?? 'Location unknwon',
                    style: TextStyleCollection.caption
                        .copyWith(color: ColorNeutral.neutral900),
                    minFontSize: 14,
                    maxFontSize: 16,
                  ),
                ],
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
                        Row(
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
                        )
                      else
                        ...searchRouteController.destinations
                            .map((destination) {
                          return Row(
                            children: [
                              Icon(
                                Icons.verified,
                                color: ColorPrimary.primary500,
                                size: 24,
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 10),
                                child: AutoSizeText(
                                  destination.name,
                                  style: TextStyleCollection.caption
                                      .copyWith(color: ColorNeutral.neutral900),
                                  minFontSize: 14,
                                  maxFontSize: 16,
                                ),
                              ),
                              const Spacer(),
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
                          );
                        }),
                    ],
                  );
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
