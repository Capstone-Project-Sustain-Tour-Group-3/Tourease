import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tourease/pages/destinasi/destinasi_page.dart';
import 'package:tourease/pages/home/home_page.dart';
import 'package:tourease/pages/profil/profil_page.dart';
import 'package:tourease/pages/route_recommendation/search_city/search_city_page.dart';

class BottomNavbarController extends GetxController {
  RxInt selectedIndex = 0.obs;
  RxString searchText = ''.obs;

  List<Widget> get optionPage => [
        const HomePage(),
        DestinasiPage(
          searchText: searchText.value,
        ),
        SearchCityPage(),
        const ProfilPage(),
      ];

  void getInitialIndex({required int index}) {
    selectedIndex.value = index;
  }

  void getPageByIndex({required int index}) {
    selectedIndex.value = index;
  }

  void updateSearchText(String text) {
    searchText.value = text;
  }
}
