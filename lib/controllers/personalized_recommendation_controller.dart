import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tourease/constants/color_constant.dart';
import 'package:tourease/constants/text_style_constant.dart';
import 'package:tourease/pages/personalized_recommendation/personalized_page_finish.dart';
import 'package:tourease/pages/personalized_recommendation/personalized_page_location.dart';
import 'package:tourease/pages/personalized_recommendation/personalized_page_tour_option.dart';

class PersonalizedRecommendationController extends GetxController {
  var currentPage = 0.obs;
  var selectedTourOptions = <int>[].obs; // kairos update
  var selectedProvinces = <int>[].obs; // kairos update
  var provincesReachedMaxChoice = false.obs;

  void updatePage(int page) {
    currentPage.value = page;
  }

  void toggleTourOptionSelection(int index) {
    //kairos update
    if (selectedTourOptions.contains(index)) {
      selectedTourOptions.remove(index);
    } else {
      selectedTourOptions.add(index);
    }
  }

  void toggleProvinceSelection(int index) {
    if (selectedProvinces.contains(index)) {
      selectedProvinces.remove(index);
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
        selectedProvinces.add(index);
      }
    }
  }

  void showFirstMaxChoiceDialog() {
    Get.snackbar(
      "Pilihan maksimal tercapai!",
      "", // "Kamu telah memilih tiga pilihan provinsi"
      snackPosition: SnackPosition.TOP,
      backgroundColor: ColorNeutral.neutral50,
      colorText: ColorNeutral.neutral700,
      boxShadows: [
        BoxShadow(
          color: ColorNeutral.neutral400,
          offset: const Offset(0, 8),
          blurRadius: 16,
        ),
      ],
      titleText: Text(
        "Pilihan maksimal tercapai!",
        style: TextStyleCollection.caption.copyWith(
          color: ColorNeutral.neutral700,
        ),
      ),
    );
  }

  void showAlertMaxChoiceDialog() {
    Get.snackbar(
      "Pilihan sudah mencapai batas maksimal!",
      "Hapus satu pilihan untuk menambahkan yang baru",
      snackPosition: SnackPosition.TOP,
      backgroundColor: ColorDanger.danger100,
      colorText: ColorDanger.danger500,
      boxShadows: [
        BoxShadow(
          color: ColorNeutral.neutral400,
          offset: const Offset(0, 8),
          blurRadius: 16,
        ),
      ],
      titleText: Text(
        "Pilihan sudah mencapai batas maksimal!",
        style: TextStyleCollection.caption.copyWith(
          color: ColorDanger.danger500,
        ),
      ),
    );
  }

  bool isTourOptionSelected(int index) {
    // kairos update
    return selectedTourOptions.contains(index);
  }

  bool isTourOptionSelectionValid() {
    return selectedTourOptions.isNotEmpty && selectedTourOptions.length <= 3;
  }

  bool isProvinceSelected(int index) {
    return selectedProvinces.contains(index);
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
    Get.to(() => const PersonalizedFinishPage());
  }
}
