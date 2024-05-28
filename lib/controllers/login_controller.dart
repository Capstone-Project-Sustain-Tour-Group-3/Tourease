import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tourease/model/login_response_model.dart';
import 'package:tourease/pages/login/login_success_page.dart';
import 'package:tourease/services/auth_service.dart';
import 'package:tourease/widgets/snackbar_widget.dart';

class LoginController extends GetxController {
  final errorMessageEmail = Rxn<String>();
  final errorMessagePassword = Rxn<String>();
  final errorMessageEmailForgetPassword = Rxn<String>();


  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController emailForgetPasswordController = TextEditingController();


  Rx<LoginResponseModel?> loginResponse = Rxn(LoginResponseModel());
  RxBool isLoadingLogin = false.obs;

  final RegExp emailRegExp = RegExp(
    r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$',
  );

  void login() async {
    isLoadingLogin.value = true;
    try {
      final response = await AuthService().login(
        email: emailController.text,
        password: passwordController.text,
      );

      loginResponse.value = response;
      Get.to(() => const LoginSuccessPage());
    } catch (e) {
      SnackbarWidget.showSnackbar(
          message:
              'Akun tidak ditemukan. Periksa kembali email dan password Anda');
    } finally {
      isLoadingLogin.value = false;
    }
  }

  void validatorEmail(String value) {
    if (value.isEmpty) {
      errorMessageEmail.value = "Email tidak boleh kosong";
    } else if (!emailRegExp.hasMatch(value)) {
      errorMessageEmail.value = "Format email tidak valid";
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
  void validatorEmailForgetPassword(String value) {
    if (value.isEmpty) {
      errorMessageEmailForgetPassword.value = "Email tidak boleh kosong";
    } else if (!emailRegExp.hasMatch(value)) {
      errorMessageEmailForgetPassword.value = "Format email tidak valid";
    } else {
      errorMessageEmailForgetPassword.value = null;
    }
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    emailForgetPasswordController.dispose();
    super.dispose();
  }
}
