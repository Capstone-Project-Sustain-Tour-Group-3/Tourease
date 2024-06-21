import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tourease/constants/color_constant.dart';
import 'package:tourease/constants/status_bar_constant.dart';
import 'package:tourease/constants/text_style_constant.dart';
import 'package:tourease/controllers/login_controller.dart';
import 'package:tourease/pages/login/forget_password_for_email_page.dart';
import 'package:tourease/pages/login/login_back.dart';
import 'package:tourease/pages/login/login_banner.dart';
import 'package:tourease/pages/login/login_button.dart';
import 'package:tourease/pages/login/login_footer.dart';
import 'package:tourease/pages/login/login_form.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});

  final LoginController loginController = Get.put(
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
                      const LoginBanner(),
                      LoginForm(),
                      Padding(
                        padding: const EdgeInsets.only(top: 12, left: 16),
                        child: GestureDetector(
                            child: Text(
                              'Lupa kata sandi?',
                              style: TextStyleCollection.caption.copyWith(
                                color: ColorPrimary.primary500,
                                fontSize: 12,
                              ),
                            ),
                            onTap: () {
                              Get.to(() => ForgetPasswordForEmailPage());
                            }),
                      )
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      LoginButton(),
                      const LoginFooter(),
                    ],
                  ),
                ],
              ),
            ),
          ),
          Obx(
            () {
              if (loginController.isLoadingLogin.value) {
                return Container(
                  color: ColorNeutral.neutral50.withOpacity(0.5),
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
            },
          ),
        ],
      ),
    );
  }
}
