import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tourease/constants/color_constant.dart';
import 'package:tourease/constants/text_style_constant.dart';
import 'package:tourease/controllers/search_route_controller.dart';
import 'package:tourease/pages/route_recommendation/search_route/search_route_button_widget.dart';
import 'package:tourease/pages/route_recommendation/search_route/search_route_destination_container_widget.dart';
import 'package:tourease/pages/route_recommendation/search_route/search_route_list_view_widget.dart';

class SearchRoutePage extends StatelessWidget {
  SearchRoutePage({super.key});

  final SearchRouteController searchRouteController =
      Get.put(SearchRouteController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorNeutral.neutral50,
      appBar: AppBar(
        backgroundColor: ColorNeutral.neutral50,
        surfaceTintColor: ColorNeutral.neutral50,
        centerTitle: true,
        leading: IconButton(
          onPressed: () {},
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
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(
              left: 16,
              top: 16,
              right: 16,
            ),
            child: AutoSizeText(
              'Banyuwangi',
              style: TextStyleCollection.bodyBold
                  .copyWith(color: ColorNeutral.neutral900),
              minFontSize: 20,
              maxFontSize: 22,
            ),
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
              onPressed: () {},
            );
          })
        ],
      ),
    );
  }
}
