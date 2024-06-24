import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tourease/constants/color_constant.dart';
import 'package:tourease/controllers/login_controller.dart';
import 'package:tourease/pages/login/login_success_page.dart';
import 'package:tourease/widgets/button_widget.dart';

class LoginButton extends StatelessWidget {
  LoginButton({super.key});
  final LoginController loginController = Get.put(
    LoginController(),
  );

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: SizedBox(
        width: double.infinity,
        height: 48,
        child: ButtonWidget(
          onPressed: () async {
            bool success = await loginController.login();
            if (success) {
              Get.to(() => const LoginSuccessPage());
            }
          },
          text: 'Masuk',
          textColor: ColorNeutral.neutral100,
        ),
      ),
    );
  }
}
