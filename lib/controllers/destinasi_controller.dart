import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tourease/controllers/logout_controller.dart';
import 'package:tourease/model/kategori_destinasi_model.dart';
import 'package:tourease/model/search_destinasi_response.dart';
import 'package:tourease/pages/splash/splash_page.dart';
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
    searchDestinasi(search: searchText);
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
    String? search,
    String? limit,
    String? page,
    String? sort,
    String? filter,
  }) async {
    isLoadingSearchDestinasi.value = true;
    destinasiResponse.value = SearchDestinasiResponse();
    try {
      final response = await DestinasiService().searchDestinasi(
        search: search,
        limit: limit,
        page: page,
        sort: sort,
        filter: filter,
      );
      destinasiResponse.value = response;
    } on DioException catch (e) {
      if (e.response?.statusCode == 500 &&
          e.response?.data['message'] == 'Token sudah kadaluwarsa') {
        final response = await RefreshTokenLogoutService().postRefreshToken();
        if (response == true) {
          searchDestinasi(
            search: search,
            limit: limit,
            page: page,
            sort: sort,
            filter: filter,
          );
        }
      } else if ((e.response?.statusCode == 400 &&
              e.response?.data['message'] == 'Token tidak boleh kosong') ||
          (e.response?.statusCode == 401 &&
              e.response?.data['message'] == 'Token tidak valid')) {
        logoutController.endSession();
        SnackbarWidget.showSnackbar(
          message: 'Sesi anda telah berakhir, mohon untuk login ulang',
        );
        Get.offAll(() => const SplashPage());
      } else {
        SnackbarWidget.showSnackbar(
          message: e.toString(),
        );
      }
    } finally {
      isLoadingSearchDestinasi.value = false;
    }
  }
}
