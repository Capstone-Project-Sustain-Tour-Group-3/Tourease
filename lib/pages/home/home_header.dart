import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:tourease/constants/assets_constant.dart';
import 'package:tourease/constants/color_constant.dart';
import 'package:tourease/constants/text_style_constant.dart';
import 'package:tourease/controllers/bottom_navbar_controller.dart';
import 'package:tourease/controllers/home_controller.dart';
import 'package:tourease/pages/bottom_navbar/bottom_navbar.dart';
import 'package:tourease/widgets/cached_network_image_widget.dart';

class HomeHeader extends StatelessWidget {
  const HomeHeader({super.key});

  @override
  Widget build(BuildContext context) {
    final HomeController homeController = Get.put(HomeController());

    final BottomNavbarController bottomNavbarController = Get.put(
      BottomNavbarController(),
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
                bottomNavbarController.selectedIndex.value = 2;
                Get.off(
                  () => BottomNavbar(
                    initialIndex: bottomNavbarController.selectedIndex.value,
                  ),
                );
              },
              child: Container(
                width: 50,
                height: 50,
                decoration: BoxDecoration(
                  color: ColorPrimary.primary900,
                  borderRadius: BorderRadius.circular(35),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(35),
                  child: const CachedNetworkImageWidget(
                    imageUrl:
                        'https://s3-alpha-sig.figma.com/img/964e/f072/9a6eefcbb85b20d81969a7235b4ac143?Expires=1717372800&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4&Signature=f5M4gc5qMeZZ3i9q9VfgQLyFLAEZJeuNEl-b~7zv3oDpvK7W~K5SQFfYkTqNd8laguwjkhk9ceCmCp0ZRYmh6bpMNmg5H-2V1WJy5PG2w26VZwYJatYbH6CJHJ8cU4--GDGU5wdY2lOfljysidH31p0drFgx4rZ1XWtu9LmmEBl8MY7TL7f9uBAa~4sRAhr0APTWAGvcISYqWyNRZDxMPB2DXfRZCkL83teh1HMJRZd54MmVcR0QEyo0u-hcNxv6Xftq~hqSWDn1m1cc32GISbUTdQrsR-osZ4yJtnNHS00vPt8gdb6flVmpVN7SyiNXDxSioIWaxAfhhx-UrsDKdg__',
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
                  AutoSizeText(
                    'Hi, YazidSyafiq!',
                    style: TextStyleCollection.bodyBold.copyWith(
                      color: ColorCollection.black,
                    ),
                    minFontSize: 16,
                    maxFontSize: 18,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  AutoSizeText(
                    'Mau kemana hari ini?',
                    style: TextStyleCollection.caption.copyWith(
                      color: ColorCollection.black,
                    ),
                    minFontSize: 14,
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
