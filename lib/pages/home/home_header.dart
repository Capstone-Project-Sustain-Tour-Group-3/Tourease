import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:tourease/constants/assets_constant.dart';
import 'package:tourease/constants/color_constant.dart';
import 'package:tourease/constants/text_style_constant.dart';
import 'package:tourease/controllers/bottom_navbar_controller.dart';
import 'package:tourease/controllers/home_controller.dart';
import 'package:tourease/controllers/profile_controller.dart';
import 'package:tourease/pages/bottom_navbar/bottom_navbar.dart';
import 'package:tourease/services/profile_service.dart';
import 'package:tourease/widgets/cached_network_image_widget.dart';

class HomeHeader extends StatelessWidget {
  const HomeHeader({super.key});

  @override
  Widget build(BuildContext context) {
    final HomeController homeController = Get.put(HomeController());

    final BottomNavbarController bottomNavbarController = Get.put(
      BottomNavbarController(),
    );

    final profileController = Get.put(
      ProfileController(
        ProfileService(),
      ),
    );

    WidgetsBinding.instance.addPostFrameCallback(
      (_) {
        profileController.getUserData();
      },
    );

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12),
      child: Container(
        width: double.infinity,
        margin: const EdgeInsets.symmetric(horizontal: 16),
        child: Row(
          children: [
            GestureDetector(
              onTap: () {
                bottomNavbarController.selectedIndex.value = 3;
                Get.off(
                  () => BottomNavbar(
                    initialIndex: bottomNavbarController.selectedIndex.value,
                  ),
                );
              },
              child: Obx(
                () => ClipRRect(
                  borderRadius: BorderRadius.circular(35),
                  child: CachedNetworkImageWidget(
                    imageUrl:
                        profileController.userData.value?.data?.fotoProfil ??
                            '',
                    height: 50,
                    width: 50,
                  ),
                ),
              ),
            ),
            const SizedBox(
              width: 12,
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Obx(
                    () => AutoSizeText(
                      'Hi, ${profileController.userData.value?.data?.username ?? ''}',
                      style: TextStyleCollection.bodyBold.copyWith(
                        color: ColorCollection.black,
                      ),
                      minFontSize: 14,
                      maxFontSize: 18,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  AutoSizeText(
                    'Mau kemana hari ini?',
                    style: TextStyleCollection.caption.copyWith(
                      color: ColorCollection.black,
                    ),
                    minFontSize: 12,
                    maxFontSize: 16,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  )
                ],
              ),
            ),
            const SizedBox(
              width: 20,
            ),
            Expanded(
              child: Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  GestureDetector(
                    onTap: () {
                      homeController.getLocation();
                    },
                    child: SvgPicture.asset(
                      AssetsCollection.locationIcon,
                      width: 15,
                    ),
                  ),
                  const SizedBox(
                    width: 4,
                  ),
                  Obx(
                    () => Flexible(
                      child: homeController.isLoading.value
                          ? Center(
                              child: SizedBox(
                                height: 15,
                                width: 15,
                                child: CircularProgressIndicator(
                                  color: ColorPrimary.primary500,
                                ),
                              ),
                            )
                          : AutoSizeText(
                              homeController.savedCity.value ?? 'Cari Lokasi',
                              style: TextStyleCollection.captionBold.copyWith(
                                color: ColorCollection.black,
                              ),
                              minFontSize: 14,
                              maxFontSize: 16,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
