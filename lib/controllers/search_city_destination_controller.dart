import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tourease/model/route_recommendation_cities_response.dart';
import 'package:tourease/pages/route_recommendation/search_route/search_route_page.dart';
import 'package:tourease/services/route_recommendation_service.dart';

class SearchCityDestinationController extends GetxController {
  var city = ''.obs;
  var searchText = ''.obs;
  var id = ''.obs;
  var errorText = Rxn<String>();
  var isLoading = false.obs;
  final TextEditingController destinasiController = TextEditingController();
  final TextEditingController searchDestinasiController =
      TextEditingController();
  var searchResults = <City>[].obs;
  var cities = <City>[].obs;

  final RouteRecommendationService _apiService = RouteRecommendationService();

  @override
  void dispose() {
    destinasiController.dispose();
    searchDestinasiController.dispose();
    super.dispose();
  }

  Future<String?> _getAccessToken() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return preferences.getString('access_token');
  }

  String capitalizeEachWord(String text) {
    if (text.isEmpty) return text;
    return text.split(' ').map(
      (word) {
        if (word.isEmpty) return word;
        return word[0].toUpperCase() + word.substring(1).toLowerCase();
      },
    ).join(' ');
  }

  void updateCity(City newCity) {
    id.value = newCity.id;
    city.value = capitalizeEachWord(newCity.nama);
    errorText.value = null;
    searchText.value = newCity.nama;
    destinasiController.text = newCity.nama;
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
          .where(
              (city) => city.nama.toLowerCase().contains(query.toLowerCase()))
          .toList();
    }
  }

  void validateCity({required String id}) {
    if (city.value.isEmpty) {
      errorText.value = 'Silahkan isi kota tujuan terlebih dahulu';
    } else {
      errorText.value = null;
      Get.to(SearchRoutePage(id: id));
    }
  }

  Future<void> fetchCities() async {
    isLoading.value = true;
    try {
      String? token = await _getAccessToken();
      if (token != null) {
        CityResponse response = await _apiService.getCities(token);
        cities.value = response.data.map((city) {
          return City(id: city.id, nama: capitalizeEachWord(city.nama));
        }).toList();
        resetSearchResults();
      } else {
        errorText.value = 'Token tidak ditemukan. Silakan login ulang.';
      }
    } catch (e) {
      errorText.value = 'Gagal mengambil data kota. Silakan coba lagi.';
    } finally {
      isLoading.value = false;
    }
  }

  @override
  void onInit() {
    super.onInit();
    fetchCities();
  }

  void clearErrorText() {
    errorText.value = null;
  }
}
