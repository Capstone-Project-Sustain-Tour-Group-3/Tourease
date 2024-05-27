import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tourease/constants/assets_constant.dart';
import 'package:tourease/constants/color_constant.dart';
import 'package:tourease/constants/status_bar_constant.dart';
import 'package:tourease/pages/login/login_page.dart';
import 'package:tourease/pages/onboarding/onboarding_view_widget.dart';
import 'package:tourease/pages/register/register_page.dart';
import 'package:tourease/widgets/button_widget.dart';

class OnboardingLoginRegisterPage extends StatelessWidget {
  const OnboardingLoginRegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    StatusBarConstant.statusBar;

    return Scaffold(
      backgroundColor: ColorNeutral.neutral50,
      body: Stack(
        children: [
          OnboardingViewWidget(
            assets: AssetsCollection.onboarding4,
            height: 298,
            title: 'Nikmati semua keuntungannya!',
            subtitle:
                'Ayo, masuk atau daftar untuk dapatkan destinasi impianmu.',
          ),
          Positioned(
            top: 40,
            left: 11.5,
            child: IconButton(
              onPressed: () {
                Get.back();
              },
              style: ButtonStyle(
                overlayColor: WidgetStatePropertyAll(ColorNeutral.neutral100),
              ),
              icon: Icon(
                Icons.arrow_back,
                color: ColorPrimary.primary500,
              ),
            ),
          ),
          Positioned(
            bottom: 24,
            left: 16,
            right: 16,
            child: Row(
              children: [
                Expanded(
                  child: SizedBox(
                    height: 48,
                    child: ButtonWidget(
                      onPressed: () {
                        Get.to(
                          () => const LoginPage(),
                        );
                      },
                      text: 'Masuk',
                      textColor: ColorPrimary.primary500,
                      side: BorderSide(
                        color: ColorPrimary.primary500,
                      ),
                      backgroundColor: ColorNeutral.neutral50,
                    ),
                  ),
                ),
                const SizedBox(
                  width: 16,
                ),
                Expanded(
                  child: SizedBox(
                    height: 48,
                    child: ButtonWidget(
                      onPressed: () {
                        Get.to(
                          () => const RegisterPage(),
                        );
                      },
                      text: 'Daftar',
                      textColor: ColorNeutral.neutral100,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
