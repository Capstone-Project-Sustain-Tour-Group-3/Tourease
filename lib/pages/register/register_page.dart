import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:tourease/constants/color_constant.dart';
import 'package:tourease/constants/status_bar_constant.dart';
import 'package:tourease/controllers/register_controller.dart';
import 'package:tourease/pages/login/login_page.dart';
import 'package:tourease/pages/register/register_back.dart';
import 'package:tourease/pages/register/terms_and_condition_page.dart';
import 'package:tourease/pages/register/register_form.dart';
import 'package:tourease/pages/register/register_button.dart';
import 'package:tourease/constants/text_style_constant.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    StatusBarConstant.statusBar;

    final RegisterController registerController = Get.put(RegisterController());

    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        statusBarColor: ColorCollection.transparent,
        statusBarIconBrightness: Brightness.dark,
      ),
    );

    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: ColorNeutral.neutral50,
      body: SafeArea(
        child: Stack(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const RegisterBack(addSpace: false),
                Expanded(
                  child: SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Buat akun baru',
                            style: TextStyleCollection.bodyBold.copyWith(
                              fontSize: 16,
                              color: ColorNeutral.neutral900,
                            ),
                          ),
                          const SizedBox(height: 8),
                          Text(
                            'Ayo! ciptakan perjalanan impianmu.',
                            style: TextStyleCollection.caption.copyWith(
                              color: ColorNeutral.neutral700,
                            ),
                          ),
                          const SizedBox(height: 24),
                          const RegisterForm(),
                          const SizedBox(height: 24),
                          Obx(
                            () => Row(
                              children: [
                                Transform.scale(
                                  scale: 1.4,
                                  child: Checkbox(
                                    value: registerController
                                        .isTermsAccepted.value,
                                    activeColor: ColorPrimary.primary500,
                                    onChanged: (bool? value) {
                                      registerController.toggleTermsAccepted();
                                    },
                                  ),
                                ),
                                Text(
                                  'Saya setuju dengan ',
                                  style: TextStyleCollection.caption.copyWith(
                                    fontSize: 14,
                                  ),
                                ),
                                InkWell(
                                  onTap: () {
                                    Get.to(
                                        () => const TermsAndConditionsPage());
                                  },
                                  child: Text(
                                    'Syarat dan Ketentuan.',
                                    style: TextStyleCollection.caption.copyWith(
                                        color: ColorPrimary.primary500,
                                        fontSize: 14),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(height: 5),
                          Obx(() => RegisterButton(
                                onPressed: registerController.isFormValid.value
                                    ? () async {
                                        await registerController.register();
                                      }
                                    : () {},
                                text: 'Daftar',
                                isEnabled: registerController.isFormValid.value,
                              )),
                          const SizedBox(height: 10),
                          Center(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Text('Sudah punya akun? '),
                                InkWell(
                                  onTap: () {
                                    Get.to(() => const LoginPage());
                                  },
                                  child: Text(
                                    'Masuk',
                                    style: TextStyle(
                                        color: ColorPrimary.primary500),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Obx(() {
              if (registerController.isLoading.value) {
                return Container(
                  color: ColorNeutral.neutral900.withOpacity(0.5),
                  child: Center(
                    child: CircularProgressIndicator(),
                  ),
                );
              } else {
                return SizedBox.shrink();
              }
            }),
          ],
        ),
      ),
    );
  }
}
