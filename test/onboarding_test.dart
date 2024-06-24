import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:tourease/controllers/onboarding_controller.dart';
import 'package:tourease/pages/onboarding/onboarding_back.dart';
import 'package:tourease/pages/onboarding/onboarding_button.dart';
import 'package:tourease/pages/onboarding/onboarding_page.dart';
import 'package:tourease/pages/onboarding/onboarding_skip.dart';

void main() {
  testWidgets(
    'UI Test Halaman Onboarding',
    (WidgetTester tester) async {
      Get.put(OnboardingController());

      await tester.pumpWidget(
        const GetMaterialApp(
          home: OnboardingPage(),
        ),
      );

      // Tes pada Tampilan Halaman Pertama Onboarding Page
      expect(find.text('Temukan Destinasi Impianmu!'), findsOneWidget);
      expect(
          find.text(
              'Jelajahi destinasi wisata tersembunyi di indonesia, temukan tempat-tempat yang belum pernah kamu bayangkan sebelumnya.'),
          findsOneWidget);

      // Swipe atau Berpindah ke Halaman Ke-dua Onboarding Page
      await tester.drag(find.byType(PageView), const Offset(-400, 0));
      await tester.pumpAndSettle();

      // Tes pada Tampilan Halaman Ke-dua Onboarding Page
      expect(find.text('Rencanakan Rute Terbaik!'), findsOneWidget);
      expect(
          find.text(
              'AI Assistant kami akan membantumu menemukan rute perjalanan yang paling sesuai dengan minat dan kebutuhanmu.'),
          findsOneWidget);

      // Swipe atau Berpindah ke Halaman Ke-tiga Onboarding Page
      await tester.drag(find.byType(PageView), const Offset(-400, 0));
      await tester.pumpAndSettle();

      // Tes pada Tampilan Halaman Ke-tiga Onboarding Page
      expect(find.text('Rasakan Pengalaman Tak Terlupakan!'), findsOneWidget);
      expect(
          find.text(
              'Dapatkan panduan budaya lokal yang autentik, tonton video conten menarik, dan ciptakan kenangan indah yang tak terlupakan di setiap destinasi.'),
          findsOneWidget);

      // Tes pada Widget Lainnya seperti Button (Skip, Back, dan Lainnya) dan Smooth Page Indicator.
      expect(find.byType(OnboardingSkip), findsOneWidget);
      expect(find.byType(OnboardingBack), findsOneWidget);
      expect(find.byType(OnboardingButton), findsOneWidget);
      expect(find.byType(SmoothPageIndicator), findsOneWidget);
    },
  );
}
