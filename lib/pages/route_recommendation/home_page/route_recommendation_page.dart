import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tourease/constants/assets_constant.dart';
import 'package:tourease/constants/color_constant.dart';
import 'package:tourease/constants/text_style_constant.dart';
import 'package:tourease/controllers/bottom_navbar_controller.dart';
import 'package:tourease/controllers/search_city_destination_controller.dart';
import 'package:tourease/model/route_recommendation_cities_response.dart';
import 'package:tourease/pages/bottom_navbar/bottom_navbar.dart';
import 'package:tourease/pages/route_recommendation/home_page/instruction_use.dart';
import 'package:tourease/pages/route_recommendation/home_page/search_city_page.dart';

class RouteHomePage extends StatelessWidget {
  final SearchCityDestinationController _searchCityDestinationController =
      Get.put(SearchCityDestinationController());

  RouteHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final BottomNavbarController bottomNavbarController =
        Get.put(BottomNavbarController());

    return PopScope(
      canPop: false,
      onPopInvoked: (backHome) {
        if (bottomNavbarController.selectedIndex.value == 2) {
          bottomNavbarController.selectedIndex.value = 0;
          Get.to(
            () => const BottomNavbar(
              initialIndex: 0,
            ),
          );
        }
      },
      child: Scaffold(
        backgroundColor: ColorNeutral.neutral50,
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const SizedBox(height: 70),
              AutoSizeText(
                'Rute Perjalanan',
                style: TextStyleCollection.bodyBold.copyWith(
                  color: ColorNeutral.neutral900,
                ),
                minFontSize: 18,
                maxFontSize: 20,
              ),
              const SizedBox(height: 50),
              Image.asset(
                AssetsCollection.logoPng,
                height: 50,
              ),
              const SizedBox(height: 20),
              AutoSizeText(
                'Selamat Datang,\nSilahkan masukkan kota tujuan Anda',
                textAlign: TextAlign.center,
                style: TextStyleCollection.caption.copyWith(
                  color: ColorNeutral.neutral900,
                  fontSize: 12,
                ),
                minFontSize: 14,
                maxFontSize: 16,
              ),
              const SizedBox(height: 45),
              GestureDetector(
                onTap: () async {
                  final result = await Get.to(() => const SearchPage());
                  if (result != null) {
                    if (result is City) {
                      _searchCityDestinationController.updateCity(result);
                    } else if (result is String) {
                      _searchCityDestinationController.cities;
                    }
                  }
                },
                child: AbsorbPointer(child: Obx(
                  () {
                    WidgetsBinding.instance.addPostFrameCallback((_) {
                      _searchCityDestinationController.destinasiController
                          .text = _searchCityDestinationController.city.value;
                    });
                    return TextField(
                      controller:
                          _searchCityDestinationController.destinasiController,
                      decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                            borderSide: BorderSide(
                              color: ColorNeutral.neutral50,
                            ),
                          ),
                          hintText: 'Pilih Kota Tujuan',
                          hintStyle: TextStyleCollection.caption.copyWith(
                            color: ColorNeutral.neutral600,
                            fontSize: 14,
                          ),
                          prefixIcon: const Icon(Icons.search),
                          errorText:
                              _searchCityDestinationController.errorText.value),
                    );
                  },
                )),
              ),
              const SizedBox(height: 20),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    _searchCityDestinationController.validateCity(
                        id: _searchCityDestinationController.id.value);
                    _searchCityDestinationController.destinasiController
                        .clear();
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: ColorPrimary.primary500,
                    padding: const EdgeInsets.symmetric(vertical: 15),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: AutoSizeText(
                    'Mulai',
                    style: TextStyleCollection.captionMedium.copyWith(
                      color: ColorNeutral.neutral50,
                    ),
                    minFontSize: 14,
                    maxFontSize: 16,
                  ),
                ),
              ),
              const SizedBox(height: 20),
              RichText(
                text: TextSpan(
                  children: [
                    const TextSpan(
                      text: 'Petunjuk penggunaan? ',
                      style: TextStyle(
                        color: Colors.black,
                      ),
                    ),
                    TextSpan(
                      text: 'Klik disini',
                      style: TextStyle(
                        color: ColorPrimary.primary500,
                      ),
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          InstructionUseBottomDialog.showInstructionDialog(
                              context);
                        },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
