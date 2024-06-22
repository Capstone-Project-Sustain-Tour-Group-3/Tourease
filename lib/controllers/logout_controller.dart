import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:tourease/pages/login/login_page.dart';
import 'package:tourease/services/refresh_token_and_logout_service.dart';
import 'package:tourease/widgets/snackbar_widget.dart';

class LogoutController extends GetxController {
  RxBool showIconButton = true.obs;
  void logout() async {
    try {
      final response = await RefreshTokenLogoutService().logout();
      if (response == true) {
        showIconButton.value = false;
        Get.offAll(() => LoginPage());
      }
    } on DioException catch (e) {
      SnackbarWidget.showSnackbar(
        message: e.toString(),
      );
    }
  }
}
