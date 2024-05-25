import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tourease/controllers/login_controller.dart';
import 'package:tourease/widgets/text_form_field_widget.dart';

class LoginForm extends StatelessWidget {
  LoginForm({super.key});

  final LoginController loginController = Get.put(
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
              titleForm: 'Email',
              hintText: 'Masukkan email anda',
              controller: loginController.emailController,
              errorText: loginController.errorMessageEmail.value,
              isPassword: false,
              onChanged: (String value) {
                loginController.validatorEmail(value);
              },
            ),
          ),
          const SizedBox(height: 24),
          Obx(
            () => TextFormFieldWidget(
              titleForm: 'Password',
              hintText: 'Masukkan password anda',
              controller: loginController.passwordController,
              errorText: loginController.errorMessagePassword.value,
              isPassword: true,
              onChanged: (String value) {
                loginController.validatorPassword(value);
              },
            ),
          ),
        ],
      ),
    );
  }
}
