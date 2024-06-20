import 'package:flutter/material.dart';
import 'package:timeline_tile_nic/timeline_tile.dart';
import 'package:tourease/constants/color_constant.dart';
import 'package:tourease/constants/text_style_constant.dart';
import 'package:tourease/pages/route_recommendation/save_route/route_card_widget.dart';

class TimelineRouteWidget extends StatelessWidget {
  final bool isLast;

  final int destinationLength;
  final String urlGambar;
  final String namaDestinasi;
  final String waktuKunjungan;
  final String waktuSelesai;
  final String waktuPerjalanan;
  final String biaya;
  final String id;

  const TimelineRouteWidget({
    super.key,
    required this.isLast,
    required this.destinationLength,
    required this.urlGambar,
    required this.namaDestinasi,
    required this.waktuKunjungan,
    required this.waktuSelesai,
    required this.biaya,
    required this.waktuPerjalanan,
    required this.id,
  });

  @override
  Widget build(BuildContext context) {
    return TimelineTile(
      indicatorStyle: IndicatorStyle(
        padding: const EdgeInsets.only(
          top: 150,
          bottom: 115,
        ),
        width: 32,
        color: ColorPrimary.primary500,
        indicatorXY: 0.48,
        height: 32,
        indicator: Container(
          height: 32,
          width: 32,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: ColorPrimary.primary500,
          ),
          alignment: Alignment.center,
          child: Text(
            destinationLength.toString(),
            style: TextStyleCollection.captionBold.copyWith(
              fontSize: 14,
              color: ColorNeutral.neutral50,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
      afterLineStyle: LineStyle(thickness: 5, color: ColorPrimary.primary100),
      axis: TimelineAxis.vertical,
      isLast: isLast,
      endChild: SizedBox(
        height: 300,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: SizedBox(
                height: 41,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(waktuPerjalanan),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 64, right: 26),
              child: RouteCardWidget(
                id: id,
                photoUrl: urlGambar,
                namaTempat: namaDestinasi,
                openTime: '$waktuKunjungan - $waktuSelesai',
                biaya: biaya,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
