import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tourease/constants/color_constant.dart';
import 'package:tourease/constants/text_style_constant.dart';
import 'package:tourease/controllers/saved_route_controller.dart';

class SavedRouteDetailPage extends StatelessWidget {
  const SavedRouteDetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    final SavedRouteController savedRouteController = Get.find();

    return Scaffold(
      appBar: AppBar(
        title: AutoSizeText(
          'Detail Rute',
          style: TextStyleCollection.bodyBold,
          minFontSize: 18,
          maxFontSize: 20,
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: Column(
          children: [
            AutoSizeText(
              savedRouteController.selectedRouteTitle.value,
              style: TextStyleCollection.bodyBold.copyWith(
                color: ColorPrimary.primary700
              ),
              minFontSize: 18,
              maxFontSize: 20,
            ),
          ],
        ),
      ),
    );
  }
}
