import 'package:flutter/material.dart';
import 'package:timeline_tile_nic/timeline_tile.dart';
import 'package:tourease/constants/color_constant.dart';
import 'package:tourease/pages/route_recommendation/save_route/starting_place_widget.dart';

class TimelineStartingPlaceWidget extends StatelessWidget {
  const TimelineStartingPlaceWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return TimelineTile(
      isFirst: true,
      afterLineStyle: LineStyle(thickness: 5, color: ColorPrimary.primary100),
      beforeLineStyle: LineStyle(thickness: 5, color: ColorPrimary.primary100),
      axis: TimelineAxis.vertical,
      endChild: const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(left: 64, right: 26),
            child: StartingPlaceWidget(),
          ),
        ],
      ),
      indicatorStyle: IndicatorStyle(
        width: 32,
        color: ColorPrimary.primary100,
        indicatorXY: 0.5,
      ),
    );
  }
}
