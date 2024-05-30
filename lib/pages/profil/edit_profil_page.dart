import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tourease/constants/assets_constant.dart';
import 'package:tourease/constants/color_constant.dart';
import 'package:tourease/constants/text_style_constant.dart';
import 'package:tourease/pages/profil/edit_profil_informasi_tambahan.dart';
import 'package:tourease/pages/profil/edit_profil_informasi_umum.dart';
import 'package:tourease/pages/profil/profil_page.dart';
import 'package:tourease/widgets/button_widget.dart';

class EditProfilPage extends StatelessWidget {
  const EditProfilPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorNeutral.neutral50,
        surfaceTintColor: ColorNeutral.neutral50,
        title: Text(
          'Edit Profil',
          style: TextStyleCollection.subtitleBold.copyWith(fontSize: 18),
        ),
        toolbarHeight: 56,
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(
            top: 24,
            left: 16,
            right: 16,
          ),
          child: Align(
            alignment: Alignment.topCenter,
            child: Column(
              children: [
                GestureDetector(
                  onTap: () {},
                  child: Container(
                    margin: const EdgeInsets.symmetric(vertical: 8),
                    width: 90,
                    height: 90,
                    child: CircleAvatar(
                      backgroundColor: ColorNeutral.neutral200,
                      child: Image.asset(
                        AssetsCollection.fileUpload,
                        width: 24,
                        height: 24,
                      ),
                    ),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(top: 24),
                  child: EditProfilInformasiUmum(),
                ),
                const Padding(
                  padding: EdgeInsets.only(top: 24, bottom: 24),
                  child: EditProfilInformasiTambahan(),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 24,
                  ),
                  child: SizedBox(
                    width: double.infinity,
                    height: 48,
                    child: ButtonWidget(
                      onPressed: () {
                        Get.back();
                      },
                      text: 'Simpan',
                      textColor: ColorCollection.whitishGray,
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
