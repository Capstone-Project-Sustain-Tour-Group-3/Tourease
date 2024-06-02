import 'package:get/get.dart';
import 'package:tourease/pages/bottom_navbar/bottom_navbar.dart';
import 'package:tourease/pages/onboarding/onboarding_page.dart';
import 'package:tourease/utils/shared_preference_utils.dart';

class SplashController extends GetxController {
  @override
  void onInit() {
    checkToken();
    super.onInit();
  }

  void checkToken() async {
    final token = await SharedPref.getAccessToken();

    Future.delayed(
      const Duration(
        seconds: 4,
      ),
      () {
        if (token == null) {
          Get.offAll(
            () => const OnboardingPage(),
          );
        } else {
          Get.offAll(
            () => const BottomNavbar(
              initialIndex: 1,
            ),
          );
        }
      },
    );
  }
}
