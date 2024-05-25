import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RegisterController extends GetxController {
  final errorMessageNamaPengguna = Rxn<String>();
  final errorMessageNamaLengkap = Rxn<String>();
  final errorMessageEmail = Rxn<String>();
  final errorMessageNomorTelepon = Rxn<String>();
  final errorMessagePassword = Rxn<String>();
  final isTermsAccepted = false.obs;
  final isFormValid = false.obs;

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
    } else {
      errorMessageNomorTelepon.value = null;
    }
    _validateForm();
  }

  void validatorPassword(String value) {
    if (value.isEmpty) {
      errorMessagePassword.value = "Password tidak boleh kosong";
    } else if (value.length < 6) {
      errorMessagePassword.value = "Password harus lebih dari 6 huruf";
    } else {
      errorMessagePassword.value = null;
    }
    _validateForm();
  }

  void toggleTermsAccepted() {
    isTermsAccepted.value = !isTermsAccepted.value;
    _validateForm();
  }

  @override
  void dispose() {
    namaPenggunaController.dispose();
    namaLengkapController.dispose();
    emailController.dispose();
    nomorTeleponController.dispose();
    passwordController.dispose();
    super.dispose();
  }
}
