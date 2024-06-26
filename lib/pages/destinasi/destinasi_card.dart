import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tourease/constants/color_constant.dart';
import 'package:tourease/constants/text_style_constant.dart';
import 'package:tourease/controllers/destinasi_controller.dart';
import 'package:tourease/pages/destinasi_detail/destinasi_detail_page.dart';
import 'package:tourease/widgets/card_widget.dart';

class DestinasiCard extends StatelessWidget {
  const DestinasiCard({super.key});

  @override
  Widget build(BuildContext context) {
    final DestinasiController destinasiController = Get.put(
      DestinasiController(),
    );

    return GridView.builder(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 2,
        childAspectRatio: 0.75,
      ),
      itemCount: destinasiController.destinasiResponse.value.data?.length,
      itemBuilder: (context, index) {
        final destinasi =
            destinasiController.destinasiResponse.value.data?[index];
        return GestureDetector(
          onTap: () {
            Get.to(
              () => DestinasiDetailPage(
                id: destinasi.id ?? '',
              ),
            );
          },
          child: CardWidget(
            imageUrl: destinasi?.urlMedia ?? '-',
            gradient: LinearGradient(
              begin: Alignment.bottomCenter,
              end: Alignment.topCenter,
              stops: const [0, 0.6],
              colors: [
                ColorCollection.black.withOpacity(0.75),
                ColorCollection.transparent,
              ],
            ),
            heightImage: 150,
            widthImage: double.infinity,
            namaDestinasi: destinasi?.nama ?? '-',
            lokasiDestinasi:
                '${destinasiController.capitalizeEachWord(destinasi?.kota ?? '-')}, ${destinasiController.capitalizeEachWord(destinasi?.provinsi ?? '-')}',
            view: Positioned(
              bottom: 12.5,
              left: 10,
              right: 10,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Icon(
                    Icons.remove_red_eye,
                    color: ColorNeutral.neutral50,
                    size: 17.5,
                  ),
                  const SizedBox(
                    width: 8,
                  ),
                  Text(
                    destinasi!.visitCount! > 999
                        ? '999+'
                        : destinasi.visitCount.toString(),
                    style: TextStyleCollection.caption.copyWith(
                      color: ColorNeutral.neutral50,
                      fontSize: 13,
                    ),
                  )
                ],
              ),
            ),
            kategori: Padding(
              padding: const EdgeInsets.all(12),
              child: IntrinsicWidth(
                child: Container(
                  height: 30,
                  decoration: BoxDecoration(
                    color: ColorNeutral.neutral100,
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Center(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 12,
                      ),
                      child: Text(
                        destinasi.kategori?.nama ?? '-',
                        style: TextStyleCollection.caption.copyWith(
                          fontSize: 12,
                          color: ColorNeutral.neutral600,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
