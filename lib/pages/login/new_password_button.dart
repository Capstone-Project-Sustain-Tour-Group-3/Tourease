import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tourease/constants/color_constant.dart';
import 'package:tourease/widgets/button_widget.dart';

import '../../controllers/login_controller.dart';

class NewPasswordButton extends StatelessWidget {
   NewPasswordButton({super.key});

 final LoginController newPasswordController = Get.put(
    LoginController(),
  );

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16,vertical: 24),
      child: SizedBox(
        width: double.infinity,
        height: 48,
        child: ButtonWidget(
          onPressed: () {
            newPasswordController.newPassword();
          },
          text: 'Lanjut',
          textColor: ColorNeutral.neutral100,
        ),
      ),
    );
  }
}