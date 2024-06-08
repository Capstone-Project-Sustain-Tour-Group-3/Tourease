import 'package:flutter/material.dart';
import 'package:tourease/constants/color_constant.dart';
import 'package:tourease/constants/status_bar_constant.dart';
import 'package:tourease/constants/text_style_constant.dart';
import 'package:tourease/pages/route_recommendation/save_route/city_name_widget.dart';
import 'package:tourease/pages/route_recommendation/save_route/footer_save_route_widget.dart';
import 'package:tourease/pages/route_recommendation/save_route/timeline_route_widget.dart';
import 'package:tourease/pages/route_recommendation/save_route/timeline_starting_place_widget.dart';

class SaveRoutePage extends StatelessWidget {
  const SaveRoutePage({super.key});

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
      body: const Stack(
        children: [
          SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CityNameWidget(),
                Padding(
                  padding: EdgeInsets.only(left: 32),
                  child: Column(
                    children: [
                      TimelineStartingPlaceWidget(),
                      TimelineRouteWidget(
                        isLast: false,
                        destinationLength: 1,
                      ),
                      TimelineRouteWidget(
                        isLast: false,
                        destinationLength: 2,
                      ),
                      TimelineRouteWidget(
                        isLast: true,
                        destinationLength: 3,
                      ),
                      SizedBox(height: 126),
                    ],
                  ),
                ),
              ],
            ),
          ),
          FooterSaveRouteWidget(),
        ],
      ),
    );
  }
}
