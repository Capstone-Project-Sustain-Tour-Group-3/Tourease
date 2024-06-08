import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:tourease/constants/assets_constant.dart';
import 'package:tourease/constants/color_constant.dart';
import 'package:tourease/constants/text_style_constant.dart';
import 'package:tourease/controllers/saved_route_controller.dart';
import 'package:tourease/pages/saved_route/dummy_data.dart';
import 'package:tourease/pages/saved_route/saved_route_page_detail.dart';
import 'package:tourease/widgets/button_widget.dart';

class SavedRouteHomeListView extends StatelessWidget {
  SavedRouteHomeListView({super.key});

  final List<Map<String, String>> plannedRoute =
      SavedRouteDummyData.plannedRoute;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: plannedRoute.length,
      itemBuilder: (context, index) {
        return SavedRouteHomeListTile(
          title: plannedRoute[index]['title']!,
          subtitle: plannedRoute[index]['subtitle']!,
        );
      },
    );
  }
}

class SavedRouteHomeListTile extends StatelessWidget {
  const SavedRouteHomeListTile({
    super.key,
    required this.title,
    required this.subtitle,
  });

  final String title;
  final String subtitle;

  @override
  Widget build(BuildContext context) {
    final SavedRouteController savedRouteController = Get.put(SavedRouteController());

    return GestureDetector(
      onTap: () {
        savedRouteController.setSelectedRouteTitle(title);
        Get.to(()=> const SavedRouteDetailPage());
      },
      child: Card.outlined(
        // color: ColorCollection.white,
        // surfaceTintColor: ColorCollection.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(4),
          side: BorderSide(
            color: ColorNeutral.neutral200,
            width: 1,
          ),
        ),
        child: ListTile(
          contentPadding: const EdgeInsets.symmetric(horizontal: 16)
              .copyWith(right: 0), //right: 6
          title: AutoSizeText(
            title,
            style: TextStyleCollection.bodyBold
                .copyWith(color: ColorPrimary.primary500),
            minFontSize: 14,
            maxFontSize: 16,
          ),
          subtitle: AutoSizeText(
            subtitle,
            style: TextStyleCollection.caption
                .copyWith(color: ColorNeutral.neutral700),
            minFontSize: 14,
            maxFontSize: 16,
          ),
          trailing: IconButton(
            icon: Icon(
              Icons.delete_outline,
              color: ColorDanger.danger400,
            ),
            onPressed: () {
              showModalBottomSheet(
                  backgroundColor: ColorCollection.white,
                  context: context,
                  showDragHandle: true,
                  builder: (BuildContext context) {
                    return _buildDeleteConfirmationSheet(context);
                  });
            },
          ),
        ),
      ),
    );
  }
}

Widget _buildDeleteConfirmationSheet(BuildContext context) {
  return Padding(
    padding: const EdgeInsets.symmetric(
      horizontal: 16,
      vertical: 24,
    ),
    child: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        SvgPicture.asset(
          AssetsCollection.deleteRoute,
          height: 140,
        ),
        const SizedBox(height: 12),
        AutoSizeText(
          'Hapus Rute?',
          style: TextStyleCollection.bodyBold.copyWith(
            color: ColorDanger.danger500,
          ),
          minFontSize: 18,
          maxFontSize: 20,
        ),
        AutoSizeText(
          'Rute yang sudah dihapus tidak \nbisa dikembalikan lagi.',
          style: TextStyleCollection.captionMedium.copyWith(
            color: ColorNeutral.neutral800,
          ),
          maxLines: 2,
          minFontSize: 14,
          maxFontSize: 16,
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 12),
        SizedBox(
          width: double.infinity,
          height: 48,
          child: ButtonWidget(
            onPressed: () {},
            text: 'Hapus',
            textColor: ColorNeutral.neutral50,
            backgroundColor: ColorDanger.danger400,
          ),
        )
      ],
    ),
  );
}
