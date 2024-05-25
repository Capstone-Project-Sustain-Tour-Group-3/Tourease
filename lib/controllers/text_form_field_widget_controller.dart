import 'package:get/get.dart';

class TextFormFieldWidgetController extends GetxController {
  RxBool isFocused = false.obs;
  RxBool isFormError = false.obs;
  RxBool obscureText = true.obs;

  void handleFocusChange(bool focus) {
    isFocused.value = focus;
  }

  bool handleErrorForm(String? errorForm) {
    if (errorForm != null) {
      return true;
    } else {
      return false;
    }
  }
}
