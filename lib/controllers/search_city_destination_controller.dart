import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tourease/model/route_recommendation_cities.dart';
import 'package:tourease/services/route_recommendation_service.dart';

class SearchCityDestinationController extends GetxController {
  var city = ''.obs;
  var searchText = ''.obs;
  var errorText = ''.obs;
  final TextEditingController destinasiController = TextEditingController();
  final TextEditingController searchDestinasiController = TextEditingController();
  var searchResults = <City>[].obs;
  var cities = <City>[].obs;

  final RouteRecommendationService _apiService = RouteRecommendationService();

  Future<String?> _getAccessToken() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return preferences.getString('access_token');
  }

  void updateCity(City newCity) {
    city.value = newCity.nama;
    errorText.value = '';
    searchText.value = newCity.nama;
    updateSearchResults(newCity.nama);
  }

  void clearControllers() {
    destinasiController.clear();
    searchDestinasiController.clear();
  }

  void resetSearchResults() {
    searchResults.value = cities;
  }

  void updateSearchResults(String query) {
    if (query.isEmpty) {
      searchResults.value = cities;
    } else {
      searchResults.value = cities
          .where((city) => city.nama.toLowerCase().contains(query.toLowerCase()))
          .toList();
    }
  }

  void validateCity() {
    if (city.value.isEmpty) {
      errorText.value = 'Silahkan isi kota tujuan terlebih dahulu';
    } else {
      errorText.value = '';
    }
  }

  Future<void> fetchCities() async {
    try {
      String? token = await _getAccessToken();
      if (token != null) {
        CityResponse response = await _apiService.getCities(token);
        cities.value = response.data;
        resetSearchResults(); 
      } else {
        errorText.value = 'Token tidak ditemukan. Silakan login ulang.';
      }
    } catch (e) {
      errorText.value = 'Gagal mengambil data kota. Silakan coba lagi.';
      
    }
  }

  @override
  void onInit() {
    super.onInit();
    fetchCities();
  }
}
