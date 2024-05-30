import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tourease/constants/color_constant.dart';
import 'package:tourease/constants/status_bar_constant.dart';
import 'package:tourease/controllers/login_controller.dart';
import 'package:tourease/pages/login/login_back.dart';
import 'package:tourease/pages/login/new_password_banner.dart';
import 'package:tourease/pages/login/new_password_button.dart';
import 'package:tourease/pages/login/new_password_form.dart';

class NewPasswordPage extends StatelessWidget {
   NewPasswordPage({super.key});
  final LoginController newPasswordController = Get.put(
    LoginController(),
  );
  @override
  Widget build(BuildContext context) {
    StatusBarConstant.statusBar;
    return Scaffold(
        backgroundColor: ColorNeutral.neutral50,
        body: Stack(
          children: [
            SingleChildScrollView(
              child: ConstrainedBox(
                constraints: BoxConstraints(
                  minHeight: MediaQuery.of(context).size.height,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const LoginBack(),
                        const NewPasswordBanner(),
                        NewPasswordForm()
                      ],
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        NewPasswordButton(),
                      ],
                    )
                  ],
                ),
              ),
            ),
            Obx(() {
              if (newPasswordController.isLoadingNewPassword.value) {
                return Container(
                  color: ColorNeutral.neutral900.withOpacity(0.5),
                  child: Center(
                    child: CircularProgressIndicator(
                      valueColor: AlwaysStoppedAnimation<Color>(
                        ColorPrimary.primary500,
                      ),
                    ),
                  ),
                );
              } else {
                return const SizedBox.shrink();
              }
            }),
          ],
        ));
  }
}
