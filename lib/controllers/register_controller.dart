import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tourease/model/user_model.dart';
import 'package:tourease/pages/register/register_verification_page.dart';
import 'package:tourease/services/auth_service.dart';
import 'package:tourease/widgets/snackbar_widget.dart';

class RegisterController extends GetxController {
  final errorMessageNamaPengguna = Rxn<String>();
  final errorMessageNamaLengkap = Rxn<String>();
  final errorMessageEmail = Rxn<String>();
  final errorMessageNomorTelepon = Rxn<String>();
  final errorMessagePassword = Rxn<String>();
  RxBool isTermsAccepted = false.obs;
  RxBool isFormValid = false.obs;
  RxBool isLoading = false.obs;
  RxBool isWaitingForOtp = false.obs;
  final start = 60.obs;
  Timer? _timer;
  RxString otp = ''.obs;
  RxString referenceId = ''.obs;
  RxBool isResendingOtp = false.obs;

  TextEditingController namaPenggunaController = TextEditingController();
  TextEditingController namaLengkapController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController nomorTeleponController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  final RegExp emailRegExp = RegExp(
    r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$',
  );

  @override
  void onInit() {
    super.onInit();
    namaPenggunaController.addListener(_validateForm);
    namaLengkapController.addListener(_validateForm);
    emailController.addListener(_validateForm);
    nomorTeleponController.addListener(_validateForm);
    passwordController.addListener(_validateForm);
  }

  void _validateForm() {
    isFormValid.value = errorMessageNamaPengguna.value == null &&
        errorMessageNamaLengkap.value == null &&
        errorMessageEmail.value == null &&
        errorMessageNomorTelepon.value == null &&
        errorMessagePassword.value == null &&
        namaPenggunaController.text.isNotEmpty &&
        namaLengkapController.text.isNotEmpty &&
        emailController.text.isNotEmpty &&
        nomorTeleponController.text.isNotEmpty &&
        passwordController.text.isNotEmpty &&
        isTermsAccepted.value;
  }

  void validatorNamaPengguna(String value) {
    if (value.isEmpty) {
      errorMessageNamaPengguna.value = "Nama Pengguna tidak boleh kosong";
    } else if (value.length < 2) {
      errorMessageNamaPengguna.value = "Nama Pengguna harus lebih dari 2 huruf";
    } else if (value.contains(' ')) {
      errorMessageNamaPengguna.value =
          "Nama Pengguna tidak boleh mengandung spasi";
    } else if (value.contains(RegExp(r'[!@#<>?":`~;[\]\\|=+)(*&^%-]'))) {
      errorMessageNamaPengguna.value =
          "Nama Pengguna tidak boleh mengandung karakter khusus";
    } else if (value.contains(RegExp(r'[A-Z]'))) {
      errorMessageNamaPengguna.value =
          "Nama Pengguna tidak boleh mengandung huruf kapital";
    } else if (value.length > 16) {
      errorMessageNamaPengguna.value =
          "Nama Pengguna harus kurang dari 16 huruf";
    } else {
      errorMessageNamaPengguna.value = null;
    }
    _validateForm();
  }

  void validatorNamaLengkap(String value) {
    if (value.isEmpty) {
      errorMessageNamaLengkap.value = "Nama Lengkap tidak boleh kosong";
    } else {
      errorMessageNamaLengkap.value = null;
    }
    _validateForm();
  }

  void validatorEmail(String value) {
    if (value.isEmpty) {
      errorMessageEmail.value = "Email tidak boleh kosong";
    } else if (!emailRegExp.hasMatch(value)) {
      errorMessageEmail.value = "Format email tidak valid";
    } else {
      errorMessageEmail.value = null;
    }
    _validateForm();
  }

  void validatorNomorTelepon(String value) {
    if (value.isEmpty) {
      errorMessageNomorTelepon.value = "Nomor Telepon tidak boleh kosong";
    } else if (value.length < 11) {
      errorMessageNomorTelepon.value =
          "Nomor Telepon harus lebih dari 11 angka";
    } else {
      errorMessageNomorTelepon.value = null;
    }
    _validateForm();
  }

  void validatorPassword(String value) {
    if (value.isEmpty) {
      errorMessagePassword.value = "Kata sandi tidak boleh kosong";
    } else if (value.length < 8) {
      errorMessagePassword.value = "Kata sandi harus lebih dari 8 huruf";
    } else {
      errorMessagePassword.value = null;
    }
    _validateForm();
  }

  void toggleTermsAccepted() {
    isTermsAccepted.value = !isTermsAccepted.value;
    _validateForm();
  }

  Future<void> register() async {
    if (isFormValid.value && isTermsAccepted.value) {
      final user = UserModel(
        username: namaPenggunaController.text,
        namaLengkap: namaLengkapController.text,
        email: emailController.text,
        noTelepon: nomorTeleponController.text,
        password: passwordController.text,
      );

      isLoading.value = true;

      try {
        referenceId.value = await AuthService().register(user);
        Get.to(() => RegisterVerificationPage(
              email: emailController.text,
              referenceId: referenceId.value,
            ));
      } catch (e) {
        String errorMessage = e.toString().replaceFirst('Exception: ', '');
        if (errorMessage.contains('username')) {
          errorMessageNamaPengguna.value = errorMessage;
        } else if (errorMessage.contains('email')) {
          errorMessageEmail.value = errorMessage;
        } else {
          SnackbarWidget.showSnackbar(message: errorMessage);
        }
        _validateForm();
      } finally {
        isLoading.value = false;
      }
    } else {
      SnackbarWidget.showSnackbar(
          message:
              'Harap periksa kembali semua field dan setujui syarat dan ketentuan');
    }
  }

  Future<void> resendOtp(String email) async {
    isResendingOtp.value = true;
    try {
      referenceId.value = await AuthService().resendOtp(email);
      startTimer();
    } catch (e) {
      SnackbarWidget.showSnackbar(message: e.toString());
    } finally {
      isResendingOtp.value = false;
    }
  }

  void startTimer() {
    isWaitingForOtp.value = true;
    const oneSec = Duration(seconds: 1);
    _timer = Timer.periodic(
      oneSec,
      (Timer timer) {
        if (start.value == 0) {
          timer.cancel();
          isWaitingForOtp.value = false;
          start.value = 60;
        } else {
          start.value--;
        }
      },
    );
  }

  @override
  void dispose() {
    namaPenggunaController.dispose();
    namaLengkapController.dispose();
    emailController.dispose();
    nomorTeleponController.dispose();
    passwordController.dispose();
    _timer?.cancel();
    super.dispose();
  }
}
