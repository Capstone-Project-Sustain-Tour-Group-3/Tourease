import 'package:flutter/material.dart';
import 'package:tourease/widgets/card_widget.dart';

class DestinasiDetailDestinasiSerupaCard extends StatelessWidget {
  const DestinasiDetailDestinasiSerupaCard({
    super.key,
    required this.url,
    required this.namaDestinasi,
    required this.lokasiDestinasi,
  });

  final String url;
  final String namaDestinasi;
  final String lokasiDestinasi;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 220,
      child: CardWidget(
        imageUrl: url,
        heightImage: 160,
        widthImage: double.infinity,
        namaDestinasi: namaDestinasi,
        lokasiDestinasi: lokasiDestinasi,
      ),
    );
  }
}
