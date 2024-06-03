import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:tourease/pages/home/home_page.dart';
import 'package:tourease/services/refresh_token_and_logout_service.dart';
import 'package:tourease/widgets/snackbar_widget.dart';

class LogoutController extends GetxController {
  void logout() async {
    try {
      final response = await RefreshTokenLogoutService().logout();
      if (response == true) {
        Get.offAll(
          () => const HomePage(),
        );
      }
    } on DioException catch (e) {
      SnackbarWidget.showSnackbar(
        message: e.toString(),
      );
    }
  }
}
