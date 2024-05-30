import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tourease/model/login_response_model.dart';
import 'package:tourease/pages/login/login_page.dart';
import 'package:tourease/pages/login/login_success_page.dart';
import 'package:tourease/pages/login/new_password_page.dart';
import 'package:tourease/pages/login/verification_otp_page.dart';
import 'package:tourease/services/auth_service.dart';
import 'package:tourease/utils/shared_preference_utils.dart';
import 'package:tourease/widgets/snackbar_widget.dart';

class LoginController extends GetxController {
  final errorMessageEmail = Rxn<String>();
  final errorMessagePassword = Rxn<String>();
  final errorMessageEmailForgetPassword = Rxn<String>();
  final errorMessagenewPassword = Rxn<String>();
  final errorMessagenewconfirmationNewPassword = Rxn<String>();

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController emailForgetPasswordController = TextEditingController();
  TextEditingController otpController = TextEditingController();
  TextEditingController newPasswordController = TextEditingController();
  TextEditingController confirmationNewPasswordController =
      TextEditingController();

  Rx<LoginResponseModel?> loginResponse = Rxn(LoginResponseModel());
  RxBool isLoadingLogin = false.obs;
  RxBool isLoadingForgetPasswordForEmail = false.obs;
  RxBool isLoadingVerify = false.obs;
  RxBool isLoadingNewPassword = false.obs;

  RxString referenceId = ''.obs;
  RxString otp = ''.obs;

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
      SharedPref.saveToken(token: response.data?.token ?? '');
      Get.to(() => const LoginSuccessPage());
    } catch (e) {
      SnackbarWidget.showSnackbar(
          message:
              'Akun tidak ditemukan. Periksa kembali email dan password Anda');
    } finally {
      isLoadingLogin.value = false;
    }
  }

  void resendOtp() async {
    isLoadingForgetPasswordForEmail.value = true;
    try {
      referenceId.value =
          await AuthService().resendOtp(emailForgetPasswordController.text);
      Get.to(() => VerificationOtpPage());
    } catch (e) {
      SnackbarWidget.showSnackbar(message: e.toString());
    } finally {
      isLoadingForgetPasswordForEmail.value = false;
    }
  }

  void verifyOtp() async {
    isLoadingVerify.value = true;
    try {
      await AuthService().verifyOtp(referenceId.value, otp.value);
      Get.to(() => NewPasswordPage());
    } catch (e) {
      SnackbarWidget.showSnackbar(message: e.toString());
    } finally {
      isLoadingVerify.value = false;
    }
  }

  void newPassword() async {
    isLoadingNewPassword.value = true;
    try {
      await AuthService().newPassword(referenceId.value,
          newPasswordController.text, confirmationNewPasswordController.text);

      Get.to(() => LoginPage());
    } catch (e) {
      SnackbarWidget.showSnackbar(message: e.toString());
    } finally {
      isLoadingNewPassword.value = false;
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

  void validateNewPassword(String value) {
    if (value.isEmpty) {
      errorMessagenewPassword.value = 'Password tidak boleh kosong';
    } else if (value.length < 6) {
      errorMessagenewPassword.value = "Password harus lebih dari 6 huruf";
    } else if (confirmationNewPasswordController.text.isNotEmpty &&
        value != confirmationNewPasswordController.text) {
      errorMessagenewPassword.value =
          'Password dan Konfirmasi Password harus sama';
    } else {
      errorMessagenewPassword.value = null;
    }
  }

  void validateConfirmationPassword(String value) {
    if (value.isEmpty) {
      errorMessagenewconfirmationNewPassword.value =
          'Konfirmasi Password tidak boleh kosong';
    } else if (value.length < 6) {
      errorMessagenewconfirmationNewPassword.value =
          "Password harus lebih dari 6 huruf";
    } else if (value != newPasswordController.text) {
      errorMessagenewconfirmationNewPassword.value =
          'Password dan Konfirmasi Password harus sama';
    } else {
      errorMessagenewconfirmationNewPassword.value = null;
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
