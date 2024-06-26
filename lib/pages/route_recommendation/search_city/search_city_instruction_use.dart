import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tourease/constants/color_constant.dart';
import 'package:tourease/constants/text_style_constant.dart';
import 'search_city_instruction_use_widget.dart';

class SearchCityInstructionUseBottomDialog {
  static void showInstructionDialog(BuildContext context) {
    Get.bottomSheet(
      Container(
        decoration: BoxDecoration(
          color: ColorNeutral.neutral50,
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(20.0),
            topRight: Radius.circular(20.0),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Container(
                  width: 70,
                  height: 4,
                  decoration: BoxDecoration(
                    color: ColorNeutral.neutral200,
                    borderRadius: BorderRadius.circular(2),
                  ),
                ),
              ),
              const SizedBox(height: 10),
              Center(
                child: Text(
                  'Petunjuk penggunaan rute perjalanan',
                  style: TextStyleCollection.bodyBold.copyWith(
                    color: ColorPrimary.primary700,
                    fontSize: 16,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              const SizedBox(height: 10),
              const SearchCityInstructionUseWidget(
                  number: '1.',
                  text: 'Tentukan kota tujuan Anda terlebih dahulu.'),
              const SearchCityInstructionUseWidget(
                  number: '2.',
                  text:
                      'Klik button "Mulai" untuk membuat destinasi rekomendasi rute Anda.'),
              const SearchCityInstructionUseWidget(
                  number: '3.',
                  text:
                      'Anda dapat menambahkan maksimal tiga rute perjalanan dalam satu rencana perjalanan.'),
              const SearchCityInstructionUseWidget(
                  number: '4.',
                  text:
                      'Pastikan untuk mengisikan semua lokasi yang ingin Anda tuju.'),
              const SearchCityInstructionUseWidget(
                  number: '5.',
                  text:
                      'Anda dapat menyimpan rute perjalanan Anda untuk digunakan kembali.'),
              const SearchCityInstructionUseWidget(
                  number: '6.',
                  text:
                      'Anda dapat melihat kembali rute yang tersimpan pada profil > rute tersimpan.'),
            ],
          ),
        ),
      ),
      isScrollControlled: true,
    );
  }
}
