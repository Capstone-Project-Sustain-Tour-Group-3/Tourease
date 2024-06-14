import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart';
import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';
import 'package:tourease/constants/assets_constant.dart';
import 'package:tourease/constants/color_constant.dart';
import 'package:tourease/constants/text_style_constant.dart';
import 'package:tourease/controllers/bottom_navbar_controller.dart';
import 'package:tourease/controllers/profile_controller.dart';
import 'package:tourease/pages/bottom_navbar/bottom_navbar.dart';
import 'package:tourease/pages/profil/edit_profil_page.dart';
import 'package:tourease/pages/profil/profil_container.dart';
import 'package:tourease/pages/profil/profil_logout_container.dart';
import 'package:tourease/pages/profil/profil_tentang_kami.dart';

class ProfilPage extends StatelessWidget {
  const ProfilPage({super.key});

  @override
  Widget build(BuildContext context) {
    final BottomNavbarController bottomNavbarController =
        Get.put(BottomNavbarController());

    final profileController = Get.put(
      ProfileController(),
    );

    profileController.getUserData();
    return PopScope(
      canPop: false,
      onPopInvoked: (backHome) {
        if (bottomNavbarController.selectedIndex.value == 3) {
          bottomNavbarController.selectedIndex.value = 0;
          Get.to(
            () => const BottomNavbar(
              initialIndex: 0,
            ),
          );
        }
      },
      child: Scaffold(
        backgroundColor: ColorNeutral.neutral50,
        appBar: AppBar(
          backgroundColor: ColorNeutral.neutral50,
          automaticallyImplyLeading: false,
          title: Text(
            'Profil',
            style: TextStyleCollection.subtitleBold.copyWith(fontSize: 18),
          ),
          centerTitle: true,
          toolbarHeight: 60,
        ),
        body: Padding(
          padding: const EdgeInsets.only(top: 16),
          child: Align(
            alignment: Alignment.topCenter,
            child: Column(
              children: [
                Obx(
                  () {
                    String? fotoProfil =
                        profileController.userData.value?.data?.fotoProfil;
                    return Container(
                      margin: const EdgeInsets.symmetric(vertical: 8),
                      width: 90,
                      height: 90,
                      child: CircleAvatar(
                        backgroundColor: ColorCollection.transparent,
                        backgroundImage:
                            profileController.isLoadingGetUser.value
                                ? null
                                : fotoProfil != null && fotoProfil.isNotEmpty
                                    ? CachedNetworkImageProvider(fotoProfil)
                                    : Svg(AssetsCollection.defaultProfile),
                        child: profileController.isLoadingGetUser.value
                            ? Shimmer.fromColors(
                                baseColor: ColorNeutral.neutral50,
                                highlightColor: ColorNeutral.neutral300,
                                child: ClipOval(
                                  child: Container(
                                    color: ColorNeutral.neutral300,
                                  ),
                                ),
                              )
                            : null,
                      ),
                    );
                  },
                ),
                const SizedBox(
                  height: 16,
                ),
                Obx(
                  () => Text(
                    profileController.userData.value?.data?.namaLengkap ??
                        "Nama Lengkap",
                    style: TextStyleCollection.bodyBold,
                  ),
                ),
                Obx(() {
                  String bio =
                      profileController.userData.value?.data?.bio ?? '';
                  if (bio.isEmpty) {
                    bio = 'Masukan bio anda';
                  }
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      bio,
                      style: TextStyleCollection.caption
                          .copyWith(color: ColorNeutral.neutral500),
                    ),
                  );
                }),
                const SizedBox(
                  height: 16,
                ),
                ProfilContainer(
                  asset: AssetsCollection.edit,
                  text: 'Edit Akun',
                  function: () {
                    Get.to(() => EditProfilPage());
                  },
                ),
                ProfilContainer(
                  asset: AssetsCollection.addLocation,
                  text: 'Rute Tersimpan',
                  function: () {},
                ),
                ProfilContainer(
                  asset: AssetsCollection.campaign,
                  text: 'Tentang Kami',
                  function: () {
                    Get.to(() => const ProfilTentangKami());
                  },
                ),
                const ProfilLogoutContainerWidget()
              ],
            ),
          ),
        ),
      ),
    );
  }
}
