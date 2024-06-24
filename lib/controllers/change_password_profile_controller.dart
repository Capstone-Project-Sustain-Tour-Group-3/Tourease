import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tourease/services/profile_service.dart';
import 'package:tourease/widgets/snackbar_widget.dart';
import 'package:tourease/constants/color_constant.dart';
import 'package:tourease/model/change_password_response_model.dart';

class UbahSandiController extends GetxController {
  final oldPasswordController = TextEditingController();
  final newPasswordController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  final ProfileService _profileService = ProfileService();
  var isLoading = false.obs;
  final errorMessageOldPassword = Rxn<String>();
  final errorMessageNewPassword = Rxn<String>();
  final errorMessageConfirmPassword = Rxn<String>();
  RxBool isFormValid = false.obs;
  var errorMessage = ''.obs;

  Future<String?> _getAccessToken() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return preferences.getString('access_token');
  }

  void validatorOldPassword(String value) {
    if (value.isEmpty) {
      errorMessageOldPassword.value = "Kata sandi lama tidak boleh kosong";
    } else if (value.length < 8) {
      errorMessageOldPassword.value = "Kata sandi lama harus lebih dari 8 huruf";
    } else {
      errorMessageOldPassword.value = null;
    }
    _validateForm();
  }

  void validatorNewPassword(String value) {
    if (value.isEmpty) {
      errorMessageNewPassword.value = "Kata sandi baru tidak boleh kosong";
    } else if (value.length < 8) {
      errorMessageNewPassword.value = "Kata sandi baru harus lebih dari 8 huruf";
    } else {
      errorMessageNewPassword.value = null;
    }
    _validateForm();
  }

  void validatorConfirmPassword(String value) {
    if (value.isEmpty) {
      errorMessageConfirmPassword.value =
          "Konfirmasi kata sandi tidak boleh kosong";
    } else if (value.length < 8) {
      errorMessageConfirmPassword.value =
          "Konfirmasi kata sandi harus lebih dari 8 huruf";
    } else if (value != newPasswordController.text) {
      errorMessageConfirmPassword.value =
          "Kata sandi baru dan konfirmasi kata sandi tidak cocok";
    } else {
      errorMessageConfirmPassword.value = null;
    }
    _validateForm();
  }

  void _validateForm() {
    isFormValid.value = errorMessageOldPassword.value == null &&
        errorMessageNewPassword.value == null &&
        errorMessageConfirmPassword.value == null &&
        oldPasswordController.text.isNotEmpty &&
        newPasswordController.text.isNotEmpty &&
        confirmPasswordController.text.isNotEmpty;
  }

  void changePassword() async {
    if (!isFormValid.value) {
      return;
    }

    isLoading.value = true;
    try {
      final token = await _getAccessToken();
      if (token == null) {
        errorMessage.value = 'Token not found';
        return;
      }

      ChangePasswordResponseModel response =
          await _profileService.changePassword(
              token,
              oldPasswordController.text,
              newPasswordController.text,
              confirmPasswordController.text);

      if (response.status == 'Success') {
        SnackbarWidget.showSnackbar(
          message: response.message ?? 'Password Anda telah berhasil diubah!',
          textColor: ColorNeutral.neutral700,
          backgroundColor: ColorNeutral.neutral50,
          textContainerColor: ColorNeutral.neutral50,
        );
      } else {
        SnackbarWidget.showSnackbar(
          message: response.message ?? 'Gagal mengubah password',
          textColor: ColorDanger.danger500,
          backgroundColor: ColorDanger.danger100,
        );
      }
    } finally {
      isLoading.value = false;
    }
  }
}
