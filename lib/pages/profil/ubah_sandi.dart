import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:tourease/constants/color_constant.dart';
import 'package:tourease/constants/text_style_constant.dart';
import 'package:tourease/widgets/button_widget.dart';
import 'package:tourease/widgets/snackbar_widget.dart';
import 'package:tourease/widgets/text_form_field_widget.dart';

class UbahSandi extends StatelessWidget {
  const UbahSandi({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorNeutral.neutral50,
      appBar: AppBar(
        toolbarHeight: 56,
      ),
      body: Padding(
        padding: const EdgeInsets.only(
          top: 16,
          left: 16,
          right: 16,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
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
                TextFormFieldWidget(
                  keyboardType: TextInputType.text,
                  titleForm: 'Kata Sandi Lama',
                  hintText: 'Masukkan password lama anda',
                  isPassword: true,
                  colorTitleText: ColorNeutral.neutral900,
                ),
                const SizedBox(
                  height: 16,
                ),
                TextFormFieldWidget(
                  keyboardType: TextInputType.text,
                  titleForm: 'Kata Sandi Baru',
                  hintText: 'Masukkan password Baru anda',
                  isPassword: true,
                  colorTitleText: ColorNeutral.neutral900,
                ),
              ],
            ),
            Container(
              width: double.infinity,
              height: 48,
              margin: const EdgeInsets.only(
                top: 4,
                bottom: 24,
              ),
              child: ButtonWidget(
                onPressed: () {
                  SnackbarWidget.showSnackbar(
                      message: 'Password Anda telah berhasil diubah!',
                      textColor: ColorNeutral.neutral700,
                      backgroundColor: ColorNeutral.neutral50,
                      textContainerColor: ColorNeutral.neutral50);
                },
                text: 'Simpan',
                textColor: ColorCollection.whitishGray,
              ),
            )
          ],
        ),
      ),
    );
  }
}
