import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tourease/constants/assets_constant.dart';
import 'package:tourease/constants/color_constant.dart';
import 'package:tourease/constants/text_style_constant.dart';
import 'package:tourease/controllers/profile_controller.dart';
import 'package:tourease/pages/profil/edit_profil_informasi_tambahan.dart';
import 'package:tourease/pages/profil/edit_profil_informasi_umum.dart';
import 'package:tourease/services/profile_service.dart';
import 'package:tourease/widgets/button_widget.dart';

class EditProfilPage extends StatelessWidget {
  EditProfilPage({super.key});
  final ProfileController editController = Get.put(
    ProfileController(ProfileService()),
  );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorNeutral.neutral50,
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
      body: Stack(
        children: [
          SingleChildScrollView(
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
                      onTap: () {
                        editController.onGalleryView();
                      },
                      child: Container(
                        margin: const EdgeInsets.symmetric(vertical: 8),
                        width: 90,
                        height: 90,
                        child: Obx(() {
                          String? fotoProfil =
                              editController.userData.value?.data?.fotoProfil;
                          return CircleAvatar(
                            backgroundColor: ColorNeutral.neutral200,
                            child: editController.imageFile.value != null
                                ? ClipOval(
                                    child: Image.file(
                                      File(
                                          editController.imageFile.value!.path),
                                      key: UniqueKey(),
                                      width: 90,
                                      height: 90,
                                      fit: BoxFit.cover,
                                    ),
                                  )
                                : fotoProfil != null && fotoProfil.isNotEmpty
                                    ? ClipOval(
                                        child: CachedNetworkImage(
                                          imageUrl: fotoProfil,
                                          width: 90,
                                          height: 90,
                                          fit: BoxFit.cover,
                                          placeholder: (context, url) =>
                                              const CircularProgressIndicator(),
                                          errorWidget: (context, url, error) =>
                                              const Icon(Icons.error),
                                        ),
                                      )
                                    : Image.asset(
                                        AssetsCollection.fileUpload,
                                        width: 24,
                                        height: 24,
                                      ),
                          );
                        }),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 24),
                      child: EditProfilInformasiUmum(),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 24, bottom: 24),
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
                            editController.editProfile();
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
          Obx(() {
            if (editController.isLoadingEditUser.value) {
              return Center(
                child: SizedBox(
                  height: 50,
                  width: 50,
                  child: CircularProgressIndicator(
                    color: ColorPrimary.primary500,
                  ),
                ),
              );
            } else {
              return Container();
            }
          }),
        ],
      ),
    );
  }
}
