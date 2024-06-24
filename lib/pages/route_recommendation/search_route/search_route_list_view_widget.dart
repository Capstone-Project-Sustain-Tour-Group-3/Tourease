import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tourease/controllers/search_route_controller.dart';
import 'package:tourease/pages/route_recommendation/search_route/search_route_tile_widget.dart';

class RouteListWidget extends StatelessWidget {
  const RouteListWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final SearchRouteController searchRouteController =
        Get.put(SearchRouteController());

    return Obx(
      () {
        return ListView.separated(
          itemCount: searchRouteController.availableDestinations.length,
          itemBuilder: (context, index) {
            final destination =
                searchRouteController.availableDestinations[index];
            return RouteListTile(
              destination: destination,
            );
          },
          separatorBuilder: (context, index) => const Divider(),
        );
      },
    );
  }
}
