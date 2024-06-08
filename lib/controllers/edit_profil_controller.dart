import 'package:get/get.dart';

class EditProfilController extends GetxController {
  RxInt selectedGender = 1.obs;

  void selectGender(int value) {
    selectedGender.value = value;
  }
}
