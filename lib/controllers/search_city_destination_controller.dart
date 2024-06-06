import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SearchCityDestinationController extends GetxController {
  var city = ''.obs;
  var searchText = ''.obs;
  var errorText = ''.obs;
  final TextEditingController destinasiController = TextEditingController();
  final TextEditingController searchDestinasiController =
      TextEditingController();
  var searchResults = <String>[].obs;

  final List<String> cities = [
    'Bali',
    'Bandung',
    'Banjarmasin',
    'Banjarbaru',
    'Banyumas',
    'Banyuwangi',
    'Batam',
    'Jakarta',
    'Surabaya',
    'Malang',
  ];

  void updateCity(String newCity) {
    city.value = newCity;
    errorText.value = ''; // Reset error text when city is updated
  }

  void clearControllers() {
    destinasiController.clear();
    searchDestinasiController.clear();
  }

  void updateSearchResults(String query) {
    if (query.isEmpty) {
      searchResults.value = cities;
    } else {
      searchResults.value = cities
          .where((city) => city.toLowerCase().contains(query.toLowerCase()))
          .toList();
    }
  }

  void validateCity() {
    if (city.value.isEmpty) {
      errorText.value = 'Silahkan isi kota tujuan terlebih dahulu';
    } else {
      errorText.value = '';
      // TODO: Implement route recommendation logic
    }
  }

  @override
  void onInit() {
    super.onInit();
    searchResults.value = cities;
  }
}
