import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tourease/constants/color_constant.dart';
import 'package:tourease/constants/text_style_constant.dart';
import 'package:tourease/controllers/search_city_destination_controller.dart';

class SearchPage extends StatelessWidget {
  final SearchCityDestinationController destinasiController = Get.find();

  SearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    destinasiController.resetSearchResults();
    return Scaffold(
      backgroundColor: ColorNeutral.neutral50,
      appBar: AppBar(
        backgroundColor: ColorNeutral.neutral50,
        surfaceTintColor: ColorNeutral.neutral50,
        leading: IconButton(
          onPressed: () {
            if (destinasiController.searchDestinasiController.text.isEmpty) {
              Get.back();
            } else {
              Get.back(
                  result: destinasiController.searchDestinasiController.text);
            }
          },
          icon: Icon(
            Icons.arrow_back,
            color: ColorPrimary.primary500,
          ),
        ),
        title: AutoSizeText(
          'Masukkan Kota',
          style: TextStyleCollection.subtitleBold.copyWith(
            color: ColorPrimary.primary900,
          ),
          minFontSize: 18,
          maxFontSize: 20,
        ),
        centerTitle: true,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(height: 20),
          Container(
            width: double.infinity,
            margin: const EdgeInsets.symmetric(horizontal: 16),
            child: TextField(
              controller: destinasiController.searchDestinasiController,
              autofocus: true,
              cursorColor: ColorNeutral.neutral900,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide(
                    color: ColorNeutral.neutral200,
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide(
                    color: ColorNeutral.neutral200,
                    width: 2.0,
                  ),
                ),
                hintText: 'Masukkan Kota Tujuan',
                hintStyle: TextStyleCollection.caption.copyWith(
                  color: ColorNeutral.neutral600,
                  fontSize: 14,
                ),
                prefixIcon: Icon(
                  Icons.search,
                  color: ColorNeutral.neutral500,
                ),
              ),
              onChanged: (value) {
                destinasiController.updateSearchResults(value);
              },
              onSubmitted: (value) {
                if (value.isNotEmpty) {
                  Get.back(result: value);
                }
              },
            ),
          ),
          const SizedBox(height: 20),
          Expanded(
            child: Obx(() {
              final searchResults = destinasiController.searchResults;
              return ListView.builder(
                itemCount: searchResults.length,
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      ListTile(
                        title: Text(
                          searchResults[index].nama,
                          style: TextStyleCollection.caption.copyWith(
                            color: ColorNeutral.neutral900,
                          ),
                        ),
                        onTap: () {
                          Get.back(result: searchResults[index]);
                        },
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16.0),
                        child: Divider(
                          color: ColorNeutral.neutral200,
                          height: 1,
                          thickness: 1,
                        ),
                      ),
                    ],
                  );
                },
              );
            }),
          ),
        ],
      ),
    );
  }
}
