import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:tourease/constants/text_style_constant.dart';
import 'package:tourease/pages/saved_route/saved_route_widget_list_view.dart';

class SavedRouteHomePage extends StatelessWidget {
  const SavedRouteHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: AutoSizeText(
          'Rute Tersimpan',
          style: TextStyleCollection.bodyBold,
          minFontSize: 18,
          maxFontSize: 20,
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: SavedRouteWidgetListView(),
      ),
    );
  }
}
