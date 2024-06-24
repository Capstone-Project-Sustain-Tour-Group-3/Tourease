import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tourease/constants/color_constant.dart';
import 'package:tourease/constants/text_style_constant.dart';
import 'package:tourease/controllers/search_route_controller.dart';
import 'package:tourease/pages/route_recommendation/search_route/search_route_model.dart';

class RouteListTile extends StatelessWidget {
  final SearchRouteModel destination;
  RouteListTile({super.key, required this.destination});

  final SearchRouteController searchRouteController =
      Get.put(SearchRouteController());

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () => searchRouteController.addDestinations(destination),
      leading: CircleAvatar(
        backgroundColor: ColorNeutral.neutral100,
        minRadius: 40,
        maxRadius: 40,
        child: Icon(
          Icons.pin_drop,
          color: ColorNeutral.neutral500,
          size: 24,
        ),
      ),
      title: LayoutBuilder(
        builder: (context, constraints) {
          return AutoSizeText(
            destination.name,
            style: TextStyleCollection.bodyBold
                .copyWith(color: ColorNeutral.neutral900),
            minFontSize: 16,
            maxFontSize: 16,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          );
        },
      ),
      subtitle: LayoutBuilder(
        builder: (context, constraints) {
          return AutoSizeText(
            destination.subtitle,
            style: TextStyleCollection.caption
                .copyWith(color: ColorNeutral.neutral900),
            minFontSize: 12,
            maxFontSize: 12,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          );
        },
      ),
      trailing: IconButton(
        icon: Icon(
          Icons.add,
          color: ColorPrimary.primary900,
          size: 20,
        ),
        onPressed: () => searchRouteController.addDestinations(destination),
      ),
    );
  }
}
