import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:tourease/constants/color_constant.dart';
import 'package:tourease/constants/text_style_constant.dart';
import 'package:tourease/controllers/change_password_profile_controller.dart';
import 'package:tourease/widgets/button_widget.dart';
import 'package:tourease/widgets/text_form_field_widget.dart';

class UbahSandi extends StatelessWidget {
  final UbahSandiController controller = Get.put(UbahSandiController());

  UbahSandi({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorNeutral.neutral50,
      appBar: AppBar(
        toolbarHeight: 56,
        surfaceTintColor: ColorNeutral.neutral50,
        backgroundColor: ColorNeutral.neutral50,
        leading: IconButton(
            icon: Icon(Icons.arrow_back, color: ColorPrimary.primary500),
            onPressed: () => Get.back()),
      ),
      body: Padding(
        padding: const EdgeInsets.only(
          top: 16,
          left: 16,
          right: 16,
        ),
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 8),
                      child: AutoSizeText(
                        'Mengubah Kata Sandi',
                        style: TextStyleCollection.bodyBold
                            .copyWith(color: ColorNeutral.neutral900),
                        minFontSize: 16,
                        maxFontSize: 18,
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.symmetric(vertical: 8),
                      width: 328,
                      child: AutoSizeText(
                        'Kata sandi baru Anda harus berbeda dari kata sandi yang pernah digunakan sebelumnya.',
                        style: TextStyleCollection.caption
                            .copyWith(color: ColorNeutral.neutral700),
                        minFontSize: 14,
                        maxFontSize: 16,
                      ),
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    Obx(() => TextFormFieldWidget(
                          controller: controller.oldPasswordController,
                          keyboardType: TextInputType.text,
                          titleForm: 'Kata Sandi Lama',
                          hintText: 'Masukkan kata sandi lama anda',
                          isPassword: true,
                          errorText: controller.errorMessageOldPassword.value,
                          onChanged: controller.validatorOldPassword,
                        )),
                    const SizedBox(
                      height: 16,
                    ),
                    Obx(() => TextFormFieldWidget(
                          controller: controller.newPasswordController,
                          keyboardType: TextInputType.text,
                          titleForm: 'Kata Sandi Baru',
                          hintText: 'Masukkan kata sandi baru anda',
                          isPassword: true,
                          errorText: controller.errorMessageNewPassword.value,
                          onChanged: controller.validatorNewPassword,
                        )),
                    const SizedBox(
                      height: 16,
                    ),
                    Obx(() => TextFormFieldWidget(
                          controller: controller.confirmPasswordController,
                          keyboardType: TextInputType.text,
                          titleForm: 'Konfirmasi Kata Sandi Baru',
                          hintText: 'Masukkan konfirmasi kata sandi anda',
                          isPassword: true,
                          errorText:
                              controller.errorMessageConfirmPassword.value,
                          onChanged: controller.validatorConfirmPassword,
                        )),
                  ],
                ),
              ),
            ),
            Obx(() {
              return Container(
                width: double.infinity,
                height: 48,
                margin: const EdgeInsets.only(
                  top: 4,
                  bottom: 24,
                ),
                child: ButtonWidget(
                  onPressed: controller.isFormValid.value
                      ? () {
                          controller.changePassword();
                        }
                      : null,
                  text: controller.isLoading.value ? 'Loading...' : 'Simpan',
                  textColor: ColorCollection.whitishGray,
                ),
              );
            }),
          ],
        ),
      ),
    );
  }
}
