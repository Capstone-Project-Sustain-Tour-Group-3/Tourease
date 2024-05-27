import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tourease/constants/color_constant.dart';
import 'package:tourease/constants/text_style_constant.dart';
import 'package:tourease/model/login_response_model.dart';
import 'package:tourease/pages/home/home_page.dart';
import 'package:tourease/services/auth_service.dart';

class LoginController extends GetxController {
  final errorMessageEmail = Rxn<String>();
  final errorMessagePassword = Rxn<String>();

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  Rx<LoginResponseModel?> loginResponse = Rxn(LoginResponseModel());
  RxBool isLoadingLogin = false.obs;

  void login() async {
    isLoadingLogin.value = true;
    try {
      final response = await AuthService.login(
        email: emailController.text,
        password: passwordController.text,
      );
      if (response.status == 'Failed') {
        Get.snackbar('Gagal Login', response.message.toString());
        return;
      }

      loginResponse.value = response;
      Get.to(() => const HomePage());
    } catch (e) {
      Get.snackbar(
        backgroundColor: ColorDanger.danger100,
        'Gagal Login',
        "Akun tidak ditemukan. Periksa kembali email dan password Anda",
        titleText: Text(
          'Gagal Login',
          style: TextStyleCollection.bodyMedium.copyWith(
            fontSize: 16,
            color: ColorDanger.danger500,
          ),
        ),
        messageText: Text(
          'Akun tidak ditemukan. Periksa kembali email dan password Anda',
          style: TextStyleCollection.caption.copyWith(
            fontSize: 14,
            color: ColorDanger.danger500,
          ),
        ),
      );
    } finally {
      isLoadingLogin.value = false;
    }
  }

  void validatorEmail(String value) {
    if (value.isEmpty) {
      errorMessageEmail.value = "Email tidak boleh kosong";
    } else {
      errorMessageEmail.value = null;
    }
  }

  void validatorPassword(String value) {
    if (value.isEmpty) {
      errorMessagePassword.value = "Password tidak boleh kosong";
    } else if (value.length < 6) {
      errorMessagePassword.value = "Password harus lebih dari 6 huruf";
    } else {
      errorMessagePassword.value = null;
    }
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }
}
