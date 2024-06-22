import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tourease/constants/color_constant.dart';
import 'package:tourease/controllers/saved_route_controller.dart';
import 'package:tourease/pages/saved_route/saved_route_home_list_tile.dart';
import 'package:tourease/pages/saved_route/saved_route_page_detail.dart';
import 'package:tourease/pages/saved_route/saved_route_result_zero.dart';
import 'package:tourease/widgets/snackbar_widget.dart';

class SavedRouteHomeListView extends StatelessWidget {
  const SavedRouteHomeListView({super.key});

  @override
  Widget build(BuildContext context) {
    final SavedRouteController savedRouteController =
        Get.put(SavedRouteController());

    WidgetsBinding.instance.addPostFrameCallback((_) {
      savedRouteController.getSavedRoute();
    });

    return Obx(
      () {
        if (savedRouteController.isLoadingSavedRoute.value) {
          return Center(
            child: CircularProgressIndicator(
              color: ColorPrimary.primary500,
            ),
          );
        } else if (savedRouteController.savedRoute.value.data?.isEmpty ==
            true) {
          return const SavedRouteResultZero();
        } else {
          return ListView.builder(
            shrinkWrap: true,
            itemCount: savedRouteController.savedRoute.value.data?.length,
            itemBuilder: (context, index) {
              final route = savedRouteController.savedRoute.value.data?[index];
              return GestureDetector(
                onTap: () {
                  Get.to(() => SavedRouteDetailPage(
                        id: route?.id ?? '',
                      ));
                },
                child: SavedRouteHomeListTile(
                  title: route?.namaRute ?? '',
                  biaya: savedRouteController.formatRupiah(route?.biaya ?? 0),
                  onPressedHapus: () async {
                    final isSuccess = await savedRouteController
                        .deleteSavedRoute(id: route?.id ?? '');

                    if (isSuccess) {
                      Get.back();
                      SnackbarWidget.showSnackbar(
                        message: 'Rute berhasil dihapus',
                        backgroundColor: ColorNeutral.neutral50,
                        textColor: ColorNeutral.neutral700,
                        textContainerColor: ColorNeutral.neutral50,
                      );
                    }
                  },
                ),
              );
            },
          );
        }
      },
    );
  }
}
