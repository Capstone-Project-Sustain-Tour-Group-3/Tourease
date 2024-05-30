import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tourease/controllers/login_controller.dart';
import 'package:tourease/widgets/text_form_field_widget.dart';

class ForgetPasswordForEmailForm extends StatelessWidget {
  ForgetPasswordForEmailForm({super.key});
  final LoginController forgetPasswordController = Get.put(
    LoginController(),
  );

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Obx(
        () => TextFormFieldWidget(
          titleForm: 'Email',
          hintText: 'Masukkan email anda',
          keyboardType: TextInputType.emailAddress,
          controller: forgetPasswordController.emailForgetPasswordController,
          errorText:
              forgetPasswordController.errorMessageEmailForgetPassword.value,
          isPassword: false,
          onChanged: (String value) {
            forgetPasswordController.validatorEmailForgetPassword(value);
          },
        ),
      ),
    );
  }
}
