import 'package:get/get.dart';
import 'package:tourease/pages/onboarding/onboarding_page.dart';

class SplashController extends GetxController {
  @override
  void onInit() {
    checkToken();
    super.onInit();
  }

  void checkToken() async {
    Future.delayed(
      const Duration(
        seconds: 4,
      ),
      () {
        Get.offAll(
          () => const OnboardingPage(),
        );
      },
    );
  }
}
