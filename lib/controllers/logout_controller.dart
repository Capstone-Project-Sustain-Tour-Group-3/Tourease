import 'package:get/get.dart';
import 'package:tourease/services/refresh_token_and_logout_service.dart';
import 'package:tourease/utils/shared_preference_utils.dart';

class LogoutController extends GetxController {
  void endSession() async {
    final refreshToken = await SharedPref.getRefreshToken();
    final response = await RefreshTokenLogoutService()
        .logout(refreshToken: refreshToken ?? '');
    if (response.status == 'Success' &&
        response.message == 'Logout berhasil!') {
      SharedPref.removeAll();
    }
  }
}
