import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tourease/controllers/register_controller.dart';
import 'package:tourease/widgets/text_form_field_widget.dart';

class RegisterForm extends StatelessWidget {
  const RegisterForm({super.key});

  @override
  Widget build(BuildContext context) {
    final RegisterController registerController = Get.find<RegisterController>();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Obx(() => TextFormFieldWidget(
              titleForm: "Nama Pengguna",
              hintText: "Masukkan nama pengguna anda",
              keyboardType: TextInputType.text,
              isPassword: false,
              controller: registerController.namaPenggunaController,
              errorText: registerController.errorMessageNamaPengguna.value,
              onChanged: registerController.validatorNamaPengguna,
            )),
        const SizedBox(height: 16),
        Obx(() => TextFormFieldWidget(
              titleForm: "Nama Lengkap",
              hintText: "Masukkan nama lengkap anda",
              keyboardType: TextInputType.text,
              isPassword: false,
              controller: registerController.namaLengkapController,
              errorText: registerController.errorMessageNamaLengkap.value,
              onChanged: registerController.validatorNamaLengkap,
            )),
        const SizedBox(height: 16),
        Obx(() => TextFormFieldWidget(
              titleForm: "Email",
              hintText: "Masukkan email anda",
              keyboardType: TextInputType.emailAddress,
              isPassword: false,
              controller: registerController.emailController,
              errorText: registerController.errorMessageEmail.value,
              onChanged: registerController.validatorEmail,
            )),
        const SizedBox(height: 16),
        Obx(() => TextFormFieldWidget(
              titleForm: "Nomor Telepon",
              hintText: "Masukkan nomor telepon anda",
              keyboardType: TextInputType.phone,
              isPassword: false,
              controller: registerController.nomorTeleponController,
              errorText: registerController.errorMessageNomorTelepon.value,
              onChanged: registerController.validatorNomorTelepon,
            )),
        const SizedBox(height: 16),
        Obx(() => TextFormFieldWidget(
              titleForm: "Password",
              hintText: "Masukkan password anda",
              keyboardType: TextInputType.text,
              isPassword: true,
              controller: registerController.passwordController,
              errorText: registerController.errorMessagePassword.value,
              onChanged: registerController.validatorPassword,
            )),
      ],
    );
  }
}
