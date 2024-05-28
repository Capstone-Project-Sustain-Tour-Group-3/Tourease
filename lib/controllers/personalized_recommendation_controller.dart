import 'package:get/get.dart';
import 'package:tourease/constants/color_constant.dart';
import 'package:tourease/pages/personalized_recommendation/personalized_page_finish.dart';
import 'package:tourease/pages/personalized_recommendation/personalized_page_location.dart';
import 'package:tourease/pages/personalized_recommendation/personalized_page_tour_option.dart';
import 'package:tourease/widgets/snackbar_widget.dart';

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
