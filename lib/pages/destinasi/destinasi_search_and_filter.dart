import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tourease/constants/color_constant.dart';
import 'package:tourease/controllers/destinasi_controller.dart';
import 'package:tourease/pages/destinasi/destinasi_filter.dart';
import 'package:tourease/pages/destinasi/destinasi_search_page.dart';
import 'package:tourease/widgets/search_text_form_field_widget.dart';

class DestinasiSearchAndFilter extends StatelessWidget {
  const DestinasiSearchAndFilter({
    super.key,
    this.searchText,
  });

  final String? searchText;

  @override
  Widget build(BuildContext context) {
    final DestinasiController destinasiController = Get.put(
      DestinasiController(),
    );

    if (searchText != null && searchText!.isNotEmpty) {
      WidgetsBinding.instance.addPostFrameCallback(
        (_) {
          destinasiController.destinasiController.text = searchText!;
        },
      );
    }

    return Container(
      width: double.infinity,
      margin: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        children: [
          Expanded(
            child: GestureDetector(
              onTap: () {
                Get.off(
                  () => const DestinasiSearchPage(),
                );
                destinasiController.destinasiController.clear();
              },
              child: AbsorbPointer(
                child: SearchTextFormFieldWidget(
                  controller: destinasiController.destinasiController,
                  readOnly: true,
                  contentPadding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 12,
                  ),
                  prefixIcon: Icon(
                    Icons.search,
                    color: ColorNeutral.neutral500,
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(
            width: 8,
          ),
          const FilterDestinasi()
        ],
      ),
    );
  }
}
