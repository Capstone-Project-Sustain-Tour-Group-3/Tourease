import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:tourease/constants/color_constant.dart';
import 'package:tourease/constants/text_style_constant.dart';
import 'package:tourease/pages/profil/edit_profil_radio_button.dart';
import 'package:tourease/widgets/text_form_field_widget.dart';

class EditProfilInformasiTambahan extends StatelessWidget {
  const EditProfilInformasiTambahan({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AutoSizeText(
            'Informasi Tambahan',
            style: TextStyleCollection.caption.copyWith(
              color: ColorPrimary.primary500,
            ),
            minFontSize: 14,
            maxFontSize: 16,
          ),
          const SizedBox(
            height: 20,
          ),
          TextFormFieldWidget(
              keyboardType: TextInputType.name,
              titleForm: 'Bio',
              hintText: 'Masukkan bio anda',
              colorTitleText: ColorNeutral.neutral900,
              isPassword: false),
          const Padding(
            padding: EdgeInsets.only(top: 16, bottom: 10),
            child: EditProfilRadioButton(),
          ),
          TextFormFieldWidget(
              keyboardType: TextInputType.name,
              titleForm: 'Kota',
              hintText: 'Masukkan kota anda',
              colorTitleText: ColorNeutral.neutral900,
              isPassword: false),
          const SizedBox(
            height: 16,
          ),
          TextFormFieldWidget(
              keyboardType: TextInputType.name,
              titleForm: 'Provinsi',
              hintText: 'Masukkan provinsi anda',
              colorTitleText: ColorNeutral.neutral900,
              isPassword: false),
        ],
      ),
    );
  }
}
