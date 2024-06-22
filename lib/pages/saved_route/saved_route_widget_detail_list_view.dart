import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tourease/controllers/saved_route_controller.dart';
import 'package:tourease/pages/destinasi_detail/destinasi_detail_page.dart';
import 'package:tourease/pages/saved_route/saved_route_detail_card.dart';

class SavedRouteDetailListView extends StatelessWidget {
  const SavedRouteDetailListView({
    super.key,
    required this.id,
  });

  final String id;

  @override
  Widget build(BuildContext context) {
    final SavedRouteController savedRouteController =
        Get.put(SavedRouteController());

    WidgetsBinding.instance.addPostFrameCallback((_) {
      savedRouteController.getDetailRoute(id: id);
    });

    return Obx(
      () => ListView.builder(
        itemCount:
            savedRouteController.detailRoute.value.data?.destinasi?.length,
        itemBuilder: (context, index) {
          final detailRoute =
              savedRouteController.detailRoute.value.data?.destinasi?[index];
          return GestureDetector(
            onTap: () {
              Get.to(
                () => DestinasiDetailPage(
                  id: detailRoute?.id ?? '',
                ),
              );
            },
            child: SavedRouteDetailCard(
              imageUrl: '',
              destinationPlace: detailRoute?.namaDestinasi ?? '',
              estimatedTime:
                  '${detailRoute?.waktuKunjungan ?? ''} - ${detailRoute?.waktuSelesaiKunjungan ?? ''}',
              cost: savedRouteController.formatRupiah(detailRoute?.biaya ?? 0),
            ),
          );
        },
      ),
    );
  }
}
