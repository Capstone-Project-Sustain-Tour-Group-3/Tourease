import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:tourease/constants/color_constant.dart';
import 'package:tourease/constants/text_style_constant.dart';
import 'package:tourease/pages/saved_route/dummy_data.dart';

class SavedRouteWidgetListView extends StatelessWidget {
  SavedRouteWidgetListView({super.key});

  final List<Map<String, String>> plannedRoute =
      SavedRouteDummyData.plannedRoute;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: plannedRoute.length,
      itemBuilder: (context, index) {
        return SavedRouteListTile(
          title: plannedRoute[index]['title']!,
          subtitle: plannedRoute[index]['subtitle']!,
        );
      },
    );
  }
}

class SavedRouteListTile extends StatelessWidget {
  const SavedRouteListTile({
    super.key,
    required this.title,
    required this.subtitle,
  });

  final String title;
  final String subtitle;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        contentPadding: const EdgeInsets.symmetric(horizontal: 16).copyWith(right: 0), //right: 6
        title: AutoSizeText(
          title,
          style: TextStyleCollection.bodyBold.copyWith(color: ColorPrimary.primary500),
          minFontSize: 14,
          maxFontSize: 16,
        ),
        subtitle: AutoSizeText(
          subtitle,
          style: TextStyleCollection.caption.copyWith(color: ColorNeutral.neutral700),
          minFontSize: 14,
          maxFontSize: 16,
        ),
        trailing: IconButton(
          icon: Icon(
            Icons.delete_outline,
            color: ColorDanger.danger400,
          ),
          onPressed: () {},
        ),
      ),
    );
  }
}
