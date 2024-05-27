import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:tourease/constants/color_constant.dart';
import 'package:tourease/constants/text_style_constant.dart';
import 'package:tourease/pages/home/home_card_destinasi.dart';

class HomeListDestinasi extends StatelessWidget {
  const HomeListDestinasi({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AutoSizeText(
            'Jelajahi Wisata Nusantara',
            style: TextStyleCollection.subtitleBold.copyWith(
              color: ColorPrimary.primary700,
            ),
            minFontSize: 18,
            maxFontSize: 20,
          ),
          const SizedBox(
            height: 16,
          ),
          Container(
            height: 228,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
            ),
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: 5,
              itemBuilder: (context, index) {
                if (index < 4) {
                  return const HomeCardDestinasi();
                } else {
                  return Container(
                    width: 135,
                    margin: const EdgeInsets.symmetric(vertical: 4),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      gradient: LinearGradient(
                        stops: const [0.3, 0.5, 0.7, 0.9, 1],
                        colors: [
                          ColorNeutral.neutral50,
                          ColorNeutral.neutral100,
                          ColorPrimary.primary100,
                          ColorPrimary.primary200,
                          ColorPrimary.primary300,
                        ],
                      ),
                    ),
                    child: GestureDetector(
                      onTap: () {},
                      child: Card(
                        color: ColorCollection.transparent,
                        shadowColor: ColorCollection.transparent,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Center(
                          child: AutoSizeText(
                            'Lihat Lainnya',
                            style: TextStyleCollection.captionBold.copyWith(
                              color: ColorNeutral.neutral700,
                            ),
                            minFontSize: 14,
                            maxFontSize: 16,
                          ),
                        ),
                      ),
                    ),
                  );
                }
              },
            ),
          )
        ],
      ),
    );
  }
}
