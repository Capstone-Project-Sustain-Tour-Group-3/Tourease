import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tourease/constants/color_constant.dart';
import 'package:tourease/constants/text_style_constant.dart';
import 'package:tourease/controllers/destinasi_controller.dart';
import 'package:tourease/widgets/button_widget.dart';
import 'package:tourease/widgets/choice_chip_widget.dart';

class FilterDestinasi extends StatelessWidget {
  const FilterDestinasi({super.key});

  @override
  Widget build(BuildContext context) {
    final DestinasiController destinasiController = Get.put(
      DestinasiController(),
    );

    return GestureDetector(
      onTap: () {
        Get.bottomSheet(
          PopScope(
            canPop: false,
            child: Container(
              width: double.infinity,
              decoration: BoxDecoration(
                color: ColorCollection.white,
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(12),
                  topRight: Radius.circular(12),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  const SizedBox(
                    height: 16,
                  ),
                  Center(
                    child: Container(
                      width: 70,
                      height: 5,
                      decoration: BoxDecoration(
                        color: ColorNeutral.neutral200,
                        borderRadius: BorderRadius.circular(
                          2,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 24,
                  ),
                  Container(
                    width: double.infinity,
                    margin: const EdgeInsets.symmetric(horizontal: 16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Kategori',
                          style: TextStyleCollection.subtitleBold.copyWith(
                            color: ColorPrimary.primary400,
                            fontSize: 18,
                          ),
                        ),
                        const SizedBox(
                          height: 16,
                        ),
                        Obx(
                          () => Wrap(
                            spacing: 8,
                            children: destinasiController.listKategori
                                .map(
                                  (kategori) => ChoiceChipWidget(
                                    isSelected: destinasiController
                                            .kategoriPilihan.value ==
                                        kategori.id,
                                    labelText: kategori.kategori,
                                    onSelected: (selected) {
                                      destinasiController
                                          .pilihKategori(kategori.id);
                                    },
                                  ),
                                )
                                .toList(),
                          ),
                        ),
                        const SizedBox(
                          height: 16,
                        ),
                        Text(
                          'Urutkan Wisata',
                          style: TextStyleCollection.subtitleBold.copyWith(
                            color: ColorPrimary.primary400,
                            fontSize: 18,
                          ),
                        ),
                        const SizedBox(
                          height: 16,
                        ),
                        Obx(
                          () => Wrap(
                            spacing: 8,
                            children: destinasiController.listUrutanWisata
                                .map(
                                  (urutan) => ChoiceChipWidget(
                                    labelText: urutan,
                                    isSelected:
                                        destinasiController.urutanPilihan ==
                                            urutan,
                                    onSelected: (selected) {
                                      destinasiController.pilihUrutan(urutan);
                                    },
                                  ),
                                )
                                .toList(),
                          ),
                        ),
                        const SizedBox(
                          height: 32,
                        ),
                        Row(
                          children: [
                            Expanded(
                              child: SizedBox(
                                height: 48,
                                child: ButtonWidget(
                                  onPressed: () {
                                    destinasiController.aturUlang(
                                      searchText: destinasiController
                                          .destinasiController.text,
                                    );
                                    Get.back();
                                  },
                                  text: 'Atur Ulang',
                                  textColor: ColorPrimary.primary500,
                                  side: BorderSide(
                                    color: ColorPrimary.primary500,
                                  ),
                                  backgroundColor: ColorNeutral.neutral50,
                                ),
                              ),
                            ),
                            const SizedBox(
                              width: 16,
                            ),
                            Expanded(
                              child: SizedBox(
                                height: 48,
                                child: ButtonWidget(
                                  onPressed: () {
                                    destinasiController.searchDestinasi();
                                    Get.back();
                                  },
                                  text: 'Terapkan',
                                  textColor: ColorNeutral.neutral100,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 24,
                  ),
                ],
              ),
            ),
          ),
          isDismissible: false,
        );
      },
      child: Obx(
        () => Container(
          width: 47.5,
          height: 47.5,
          decoration: BoxDecoration(
            color: destinasiController.kategoriPilihan.isNotEmpty ||
                    destinasiController.urutanPilihan.isNotEmpty
                ? ColorPrimary.primary400
                : ColorNeutral.neutral50,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Center(
            child: Icon(
              Icons.filter_list,
              color: destinasiController.kategoriPilihan.isNotEmpty ||
                      destinasiController.urutanPilihan.isNotEmpty
                  ? ColorNeutral.neutral50
                  : ColorPrimary.primary500,
            ),
          ),
        ),
      ),
    );
  }
}
