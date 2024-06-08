import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:tourease/constants/color_constant.dart';
import 'package:tourease/constants/text_style_constant.dart';
import 'package:tourease/pages/saved_route/dummy_data.dart';
import 'package:tourease/widgets/cached_network_image_widget.dart';

class SavedRouteDetailListView extends StatelessWidget {
  SavedRouteDetailListView({super.key});

  final List<Map<String, String>> detailRoute = SavedRouteDummyData.detailRoute;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: detailRoute.length,
      itemBuilder: (context, index) {
        return SavedRouteDetailListTile(
          imageUrl: detailRoute[index]['imageUrl']!,
          destinationPlace: detailRoute[index]['destinationPlace']!,
          estimatedTime: detailRoute[index]['estimatedTime']!,
          cost: detailRoute[index]['cost']!,
        );
      },
    );
  }
}

class SavedRouteDetailListTile extends StatelessWidget {
  const SavedRouteDetailListTile({
    super.key,
    required this.imageUrl,
    required this.destinationPlace,
    required this.estimatedTime,
    required this.cost,
  });

  final String imageUrl;
  final String destinationPlace;
  final String estimatedTime;
  final String cost;

  @override
  Widget build(BuildContext context) {
    return Card.outlined(
      elevation: 1,
      shadowColor: Colors.black.withOpacity(0.1),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(4),
        side: BorderSide(
          color: ColorNeutral.neutral200,
          width: 1,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: const BorderRadius.all(
                Radius.circular(10),
              ),
              child: CachedNetworkImageWidget(
                imageUrl: imageUrl,
                width: double.infinity,
                height: 176,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(height: 12),
            AutoSizeText(
              destinationPlace,
              style: TextStyleCollection.bodyBold,
              minFontSize: 16,
              maxFontSize: 18,
            ),
            AutoSizeText(
              estimatedTime,
              style: TextStyleCollection.captionMedium
                  .copyWith(color: ColorNeutral.neutral900),
              minFontSize: 12,
              maxFontSize: 14,
            ),
            const SizedBox(height: 18),
            AutoSizeText(
              cost,
              style: TextStyleCollection.bodyBold
                  .copyWith(color: ColorPrimary.primary600),
              minFontSize: 14,
              maxFontSize: 16,
            ),
          ],
        ),
      ),
    );
  }
}
