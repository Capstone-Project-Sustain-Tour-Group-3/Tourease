import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tourease/widgets/text_form_field_widget.dart';

import '../../controllers/login_controller.dart';

class NewPasswordForm extends StatelessWidget {
   NewPasswordForm({super.key});
 final LoginController newPasswordController = Get.put(
    LoginController(),
  );

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        children: [
          Obx(
            () => TextFormFieldWidget(
              titleForm: 'Password',
              hintText: 'Masukkan password anda',
              keyboardType: TextInputType.text,
              controller: newPasswordController.newPasswordController,
              errorText: newPasswordController.errorMessagenewPassword.value,
              isPassword: true,
              onChanged: (String value) {
               newPasswordController.validateNewPassword(value);
              },
            ),
          ),
          const SizedBox(height: 24),
          Obx(
            () => TextFormFieldWidget(
              titleForm: 'Konfirmasi Password',
              hintText: 'Masukkan password anda',
              keyboardType: TextInputType.text,
              controller: newPasswordController.confirmationNewPasswordController,
              errorText: newPasswordController.errorMessagenewconfirmationNewPassword.value,
              isPassword: true,
              onChanged: (String value) {
               newPasswordController.validateConfirmationPassword(value);
              },
            ),
          ),
        ],
      ),
    );
  }
}
