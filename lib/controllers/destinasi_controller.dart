import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tourease/utils/shared_preference_utils.dart';

class DestinasiController extends GetxController {
  RxList searchHistory = <String>[].obs;

  @override
  void onInit() {
    loadSearchHistory();
    super.onInit();
  }

  void loadSearchHistory() async {
    searchHistory.value = await SharedPref.getSearchHistory();
  }

  void saveSearchHistory(String value) async {
    SharedPref.saveSearchHistory(value);
    if (!searchHistory.contains(value)) {
      searchHistory.insert(0, value);
    }
  }

  void deleteSearchHistory(int index) async {
    SharedPref.deleteSearchHistory(index);
    searchHistory.removeAt(index);
  }

  TextEditingController searchDestinasiController = TextEditingController();
  TextEditingController destinasiController = TextEditingController();

  RxList listKategori = <String>['Alam', 'Seni & Budaya', 'Sejarah'].obs;
  RxList kategoriPilihan = <String>[].obs;

  void pilihKategori(String kategori) {
    if (!kategoriPilihan.contains(kategori)) {
      kategoriPilihan.add(kategori);
    } else {
      kategoriPilihan.remove(kategori);
    }
  }

  RxList listUrutanWisata = <String>['Populer', 'Terbaru', 'Terlama'].obs;
  RxString urutanPilihan = ''.obs;

  void pilihUrutan(String urutan) {
    if (urutanPilihan.value == urutan) {
      urutanPilihan.value = '';
    } else {
      urutanPilihan.value = urutan;
    }
  }

  void aturUlang() {
    urutanPilihan.value = '';
    kategoriPilihan.value = <String>[];
  }

  @override
  void dispose() {
    searchDestinasiController.dispose();
    destinasiController.dispose();
    super.dispose();
  }
}
