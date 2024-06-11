import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tourease/pages/destinasi_detail/destinasi_detail_page.dart';
// import 'package:get/get.dart';
// import 'package:tourease/pages/destinasi_detail/destinasi_detail_page.dart';
import 'package:tourease/widgets/card_widget.dart';

class HomeCardDestinasi extends StatelessWidget {
  const HomeCardDestinasi({
    super.key,
    required this.url,
    required this.namaDestinasi,
    required this.lokasiDestinasi,
    required this.id,
  });

  final String url;
  final String namaDestinasi;
  final String lokasiDestinasi;
  final String id;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 220,
      child: GestureDetector(
        onTap: () {
          Get.to(
            () => DestinasiDetailPage(id: id),
          );
        },
        child: CardWidget(
          imageUrl: url,
          heightImage: 160,
          widthImage: double.infinity,
          namaDestinasi: namaDestinasi,
          lokasiDestinasi: lokasiDestinasi,
        ),
      ),
    );
  }
}
