import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tourease/constants/assets_constant.dart';
import 'package:tourease/constants/color_constant.dart';
import 'package:tourease/constants/text_style_constant.dart';
import 'package:tourease/pages/profil/edit_profil_page.dart';
import 'package:tourease/pages/profil/profil_container.dart';
import 'package:tourease/pages/profil/profil_logout_container.dart';

class ProfilPage extends StatelessWidget {
  const ProfilPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
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
              Container(
                margin: const EdgeInsets.symmetric(vertical: 8),
                width: 90,
                height: 90,
                child: CircleAvatar(
                  backgroundImage: AssetImage(AssetsCollection.profilReview),
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              Text(
                'Al Akbar Baihaqi',
                style: TextStyleCollection.bodyBold,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  'Masukan bio anda',
                  style: TextStyleCollection.caption
                      .copyWith(color: ColorNeutral.neutral500),
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              ProfilContainer(
                asset: AssetsCollection.edit,
                text: 'Edit Akun',
                function: () {
                  Get.to(() => const EditProfilPage());
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
                function: () {},
              ),
              const ProfilLogoutContainerWidget()
            ],
          ),
        ),
      ),
    );
  }
}
