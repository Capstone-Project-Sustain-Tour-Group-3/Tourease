import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tourease/constants/color_constant.dart';
import 'package:tourease/constants/text_style_constant.dart';
import 'package:tourease/pages/destinasi_detail/destinasi_detail_page.dart';

class RouteCardWidget extends StatelessWidget {
  final String photoUrl;
  final String namaTempat;
  final String openTime;
  final String biaya;
  final String id;

  const RouteCardWidget(
      {super.key,
      required this.namaTempat,
      required this.openTime,
      required this.biaya,
      required this.photoUrl,
      required this.id});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Get.to(
          () => DestinasiDetailPage(
            id: id,
          ),
        );
      },
      child: Container(
        decoration: BoxDecoration(
          color: ColorCollection.white,
          border: Border.all(
            color: ColorNeutral.neutral200,
            width: 1,
          ),
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: ColorCollection.black.withOpacity(0.05),
              offset: const Offset(0, 12),
              blurRadius: 24,
            ),
          ],
        ),
        width: 210,
        height: 244,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(12),
              child: Padding(
                padding: const EdgeInsets.all(3),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          Colors.transparent,
                          Colors.black.withOpacity(0.3),
                        ],
                      ),
                    ),
                    child: Image.network(
                      photoUrl,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 12, left: 12, right: 12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    namaTempat,
                    style: TextStyleCollection.captionBold.copyWith(
                      color: ColorNeutral.neutral800,
                      fontSize: 14,
                    ),
                  ),
                  const SizedBox(height: 3),
                  Text(
                    openTime,
                    style: TextStyleCollection.bodyMedium.copyWith(
                      color: ColorNeutral.neutral900,
                      fontSize: 12,
                    ),
                  ),
                  const SizedBox(height: 18),
                  Text(
                    biaya,
                    style: TextStyleCollection.captionBold.copyWith(
                      color: ColorPrimary.primary600,
                      fontSize: 14,
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
