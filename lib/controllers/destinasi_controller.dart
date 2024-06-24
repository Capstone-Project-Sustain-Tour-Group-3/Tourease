import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tourease/controllers/logout_controller.dart';
import 'package:tourease/model/kategori_destinasi_model.dart';
import 'package:tourease/model/search_destinasi_response.dart';
import 'package:tourease/pages/login/login_page.dart';
import 'package:tourease/services/destinasi_service.dart';
import 'package:tourease/services/refresh_token_and_logout_service.dart';
import 'package:tourease/utils/shared_preference_utils.dart';
import 'package:tourease/widgets/snackbar_widget.dart';

class DestinasiController extends GetxController {
  LogoutController logoutController = Get.put(LogoutController());

  RxList<String> searchHistory = <String>[].obs;

  @override
  void onInit() {
    loadSearchHistory();
    super.onInit();
  }

  void loadSearchHistory() async {
    searchHistory.value = await SharedPref.getSearchHistory();
  }

  void saveSearchHistory(String value) {
    SharedPref.saveSearchHistory(value);
    if (!searchHistory.contains(value)) {
      searchHistory.insert(0, value);
    }
  }

  void deleteSearchHistory(int index) {
    SharedPref.deleteSearchHistory(index);
    searchHistory.removeAt(index);
  }

  TextEditingController searchDestinasiController = TextEditingController();
  TextEditingController destinasiController = TextEditingController();

  RxList<KategoriDestinasiModel> listKategori = <KategoriDestinasiModel>[
    KategoriDestinasiModel(
      id: 'eb77b590-b255-4ea1-b11a-d445a259ac61',
      kategori: 'Alam',
    ),
    KategoriDestinasiModel(
      id: 'eb77b590-b255-4ea1-b11a-d445a259ac62',
      kategori: 'Seni dan Budaya',
    ),
    KategoriDestinasiModel(
      id: 'eb77b590-b255-4ea1-b11a-d445a259ac63',
      kategori: 'Sejarah',
    )
  ].obs;

  RxString kategoriPilihan = ''.obs;

  void pilihKategori(String id) {
    if (kategoriPilihan.value == id) {
      kategoriPilihan.value = '';
    } else {
      kategoriPilihan.value = id;
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

  void aturUlang({String? searchText}) {
    urutanPilihan.value = '';
    kategoriPilihan.value = '';
    searchDestinasi();
  }

  @override
  void dispose() {
    searchDestinasiController.dispose();
    destinasiController.dispose();
    super.dispose();
  }

  Rx<SearchDestinasiResponse> destinasiResponse = SearchDestinasiResponse().obs;
  RxBool isLoadingSearchDestinasi = false.obs;

  void searchDestinasi({
    int? limit,
  }) async {
    isLoadingSearchDestinasi.value = true;
    destinasiResponse.value = SearchDestinasiResponse();
    try {
      final response = await DestinasiService().searchDestinasi(
        search: destinasiController.text,
        limit: limit ?? 1000,
        sort: urutanPilihan.value.toLowerCase(),
        filter: kategoriPilihan.value,
      );
      destinasiResponse.value = response;
    } on DioException catch (e) {
      if (e.response?.statusCode == 500 &&
          e.response?.data['message'] == 'Token sudah kadaluwarsa') {
        final response = await RefreshTokenLogoutService().postRefreshToken();
        if (response == true) {
          searchDestinasi(
            limit: limit,
          );
        } else {
          SnackbarWidget.showSnackbar(
            message: 'Sesi anda telah berakhir, silahkan login kembali',
          );
          SharedPref.removeAll();
          Get.offAll(() => LoginPage(
                showIconButton: false,
          ));
        }
      }
    } finally {
      isLoadingSearchDestinasi.value = false;
    }
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
}
