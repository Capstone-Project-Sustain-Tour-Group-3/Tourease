import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tourease/constants/assets_constant.dart';
import 'package:tourease/constants/color_constant.dart';
import 'package:tourease/constants/text_style_constant.dart';
import 'package:tourease/controllers/profile_controller.dart';
import 'package:tourease/pages/profil/edit_profil_container.dart';
import 'package:tourease/pages/profil/ubah_sandi.dart';
import 'package:tourease/services/profile_service.dart';
import 'package:tourease/widgets/text_form_field_widget.dart';

class EditProfilInformasiUmum extends StatelessWidget {
  EditProfilInformasiUmum({super.key});
  final ProfileController editController = Get.put(
    ProfileController(ProfileService()),
  );
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AutoSizeText(
            'Informasi Umum',
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
            titleForm: 'Nama Pengguna',
            hintText: 'Masukkan nama anda',
            colorTitleText: ColorNeutral.neutral900,
            isPassword: false,
            controller: editController.usernameController,
          ),
          const SizedBox(
            height: 19,
          ),
          TextFormFieldWidget(
            keyboardType: TextInputType.name,
            titleForm: 'Nama Lengkap',
            hintText: 'Masukkan nama lengkap anda',
            isPassword: false,
            colorTitleText: ColorNeutral.neutral900,
            controller: editController.namaLengkapController,
          ),
          const SizedBox(
            height: 19,
          ),
          TextFormFieldWidget(
            keyboardType: TextInputType.emailAddress,
            titleForm: 'Email',
            hintText: 'Masukkan email anda',
            isPassword: false,
            colorTitleText: ColorNeutral.neutral900,
            controller: editController.emailController,
          ),
          const SizedBox(
            height: 19,
          ),
          TextFormFieldWidget(
            keyboardType: TextInputType.phone,
            titleForm: 'Nomor Telepon',
            hintText: 'Masukkan nomor telepon anda',
            isPassword: false,
            colorTitleText: ColorNeutral.neutral900,
            controller: editController.nomorTeleponController,
          ),
          const SizedBox(
            height: 24,
          ),
          EditProfileContainer(
            asset: AssetsCollection.lock,
            text: 'Ubah Kata Sandi',
            function: () {
              Get.to(() => UbahSandi());
            },
          )
        ],
      ),
    );
  }
}
