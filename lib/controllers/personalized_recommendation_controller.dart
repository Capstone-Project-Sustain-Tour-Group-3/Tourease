import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:tourease/constants/color_constant.dart';
import 'package:tourease/model/personalized_recommendation_categories_model.dart';
import 'package:tourease/model/personalized_recommendation_provinces_model.dart';
import 'package:tourease/model/personalized_recommendation_selection_model.dart';
import 'package:tourease/pages/bottom_navbar/bottom_navbar.dart';
import 'package:tourease/pages/login/login_page.dart';
import 'package:tourease/pages/personalized_recommendation/personalized_page_finish.dart';
import 'package:tourease/pages/personalized_recommendation/personalized_page_location.dart';
import 'package:tourease/pages/personalized_recommendation/personalized_page_tour_option.dart';
import 'package:tourease/services/personalized_recommendation_service.dart';
import 'package:tourease/services/refresh_token_and_logout_service.dart';
import 'package:tourease/utils/shared_preference_utils.dart';
import 'package:tourease/widgets/snackbar_widget.dart';

class PersonalizedRecommendationController extends GetxController {
  var currentPage = 0.obs;
  var selectedTourOptions = <String>[].obs; // kairos update
  var selectedProvinces = <String>[].obs; // kairos update
  var provincesReachedMaxChoice = false.obs;

  void updatePage(int page) {
    currentPage.value = page;
  }

  void toggleTourOptionSelection(String id) {
    //kairos update
    if (selectedTourOptions.contains(id)) {
      selectedTourOptions.remove(id);
    } else {
      selectedTourOptions.add(id);
    }
  }

  void toggleProvinceSelection(String id) {
    if (selectedProvinces.contains(id)) {
      selectedProvinces.remove(id);
      provincesReachedMaxChoice.value = false;
    } else {
      if (selectedProvinces.length >= 3) {
        if (provincesReachedMaxChoice.value) {
          showAlertMaxChoiceDialog();
        } else {
          showFirstMaxChoiceDialog();
          provincesReachedMaxChoice.value = true;
        }
      } else {
        selectedProvinces.add(id);
      }
    }
  }

  void showFirstMaxChoiceDialog() {
    SnackbarWidget.showSnackbar(
      message: "Pilihan maksimal tercapai!",
      backgroundColor: ColorNeutral.neutral50,
      textContainerColor: ColorNeutral.neutral50,
      textColor: ColorNeutral.neutral700,
    );
  }

  void showAlertMaxChoiceDialog() {
    SnackbarWidget.showSnackbar(
        message:
            "Pilihan sudah mencapai batas maksimal! \nHapus satu pilihan untuk menambahkan yang baru");
  }

  bool isTourOptionSelected(String id) {
    // kairos update
    return selectedTourOptions.contains(id);
  }

  bool isTourOptionSelectionValid() {
    return selectedTourOptions.isNotEmpty && selectedTourOptions.length <= 3;
  }

  bool isProvinceSelected(String id) {
    return selectedProvinces.contains(id);
  }

  bool isProvinceSelectionValid() {
    return selectedProvinces.isNotEmpty && selectedProvinces.length <= 3;
  }

  void navigateToTourOptionPage() {
    Get.to(() => const PersonalizedTourOptionPage());
  }

  void navigateToLocationPage() {
    Get.to(() => const PersonalizedLocationPage());
  }

  void navigateToFinishPage() {
    postSelection();
    Get.to(() => const PersonalizedFinishPage());
  }

  void navigateToHomePage() {
    Get.offAll(
      () => const BottomNavbar(
        initialIndex: 0,
      ),
    );
  }

  Rx<PersonalizedCategoriesModel> categories =
      PersonalizedCategoriesModel().obs;
  RxBool isLoadingCategory = false.obs;

  void getCategories() async {
    isLoadingCategory.value = true;
    categories.value = PersonalizedCategoriesModel();
    try {
      final response = await PersonalizedRecommendationService().getCategory();
      categories.value = response;
    } on DioException catch (e) {
      if (e.response?.statusCode == 500 &&
          e.response?.data['message'] == 'Token sudah kadaluwarsa') {
        final response = await RefreshTokenLogoutService().postRefreshToken();
        if (response == true) {
          getCategories();
        } else {
          SnackbarWidget.showSnackbar(
            message: 'Sesi anda telah berakhir, silahkan login kembali',
          );
          SharedPref.removeAll();
          Get.offAll(() => LoginPage());
        }
      }
    } finally {
      isLoadingCategory.value = false;
    }
  }

  Rx<PersonalizedProvincesModel> provinces = PersonalizedProvincesModel().obs;
  RxBool isLoadingProvincy = false.obs;

  void getProvinces() async {
    isLoadingProvincy.value = true;
    provinces.value = PersonalizedProvincesModel();
    try {
      final response = await PersonalizedRecommendationService().getProvincy();
      provinces.value = response;
    } on DioException catch (e) {
      if (e.response?.statusCode == 500 &&
          e.response?.data['message'] == 'Token sudah kadaluwarsa') {
        final response = await RefreshTokenLogoutService().postRefreshToken();
        if (response == true) {
          getProvinces();
        } else {
          SnackbarWidget.showSnackbar(
            message: 'Sesi anda telah berakhir, silahkan login kembali',
          );
          SharedPref.removeAll();
          Get.offAll(() => LoginPage());
        }
      }
    } finally {
      isLoadingProvincy.value = false;
    }
  }

  void postSelection() async {
    try {
      final selection = PersonalizedSelectionModel(
        idKategori: selectedTourOptions,
        idProvinsi: selectedProvinces,
      );
      await PersonalizedRecommendationService().postPersonalization(selection);
    } on DioException catch (e) {
      if (e.response?.statusCode == 500 &&
          e.response?.data['message'] == 'Token sudah kadaluwarsa') {
        final response = await RefreshTokenLogoutService().postRefreshToken();
        if (response == true) {
          getProvinces();
        } else {
          SnackbarWidget.showSnackbar(
            message: 'Sesi anda telah berakhir, silahkan login kembali',
          );
          SharedPref.removeAll();
          Get.offAll(() => LoginPage());
        }
      } else if (e.response?.statusCode == 409 &&
          e.response?.data['message'] == 'Personalisasi sudah dibuat') {
        SnackbarWidget.showSnackbar(
          message: 'Personalisasi sudah dibuat',
        );
      }
    }
  }
}
