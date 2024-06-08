import 'package:flutter/material.dart';
import 'package:timeline_tile_nic/timeline_tile.dart';
import 'package:tourease/constants/color_constant.dart';
import 'package:tourease/constants/text_style_constant.dart';
import 'package:tourease/pages/route_recommendation/save_route/route_card_widget.dart';

class TimelineRouteWidget extends StatelessWidget {
  final bool isLast;
  final int destinationLength;
  const TimelineRouteWidget(
      {super.key, required this.isLast, required this.destinationLength});

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
      endChild: const SizedBox(
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
                    Text('1j20m'),
                  ],
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 64, right: 26),
              child: RouteCardWidget(
                photoUrl:
                    'https://s3-alpha-sig.figma.com/img/c2e3/979b/84ab1c74580bd5751e3492b346f9b9b5?Expires=1717977600&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4&Signature=RCpjEhDNDe9QKUFdK09Ylf~oyTu1mfQ6yPnTjD5ZrQQRq6Bn8foNdrmrHnSzlvdlG7kha4Qv0fP6QltWAFZ0KENu7op0Lrzz0pdFRx-RveXkg1MGFncHALcx66xtB5L1GqwCo4JO6vH3w080Fegzv0MhIAdBCPc4h3wA9Tdt3ize-duC4mvIUVKjM0Vs5fWJvoNiyO2a2tW56Zb2uhF3J13RItlkq1aHpzT0ATwTvusClnpOAF~oTf4fmIElQi9XWeCgvoDDufRUxWNrgbQ-67PT6DGIV0GjRwl7YVD4uSaEJCg47pjwcuEQtqmw5inXq75o2s5wcX2NZ4dDk7ROWQ__',
                namaTempat: 'Taman Nasional Baluran',
                openTime: '08.45 - 11.45',
                biaya: 'Rp 150.000',
              ),
            ),
          ],
        ),
      ),
    );
  }
}
