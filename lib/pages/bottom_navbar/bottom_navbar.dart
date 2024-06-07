import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:tourease/constants/assets_constant.dart';
import 'package:tourease/constants/color_constant.dart';
import 'package:tourease/constants/text_style_constant.dart';
import 'package:tourease/controllers/bottom_navbar_controller.dart';

class BottomNavbar extends StatelessWidget {
  const BottomNavbar({
    super.key,
    required this.initialIndex,
  });

  final int initialIndex;

  @override
  Widget build(BuildContext context) {
    final BottomNavbarController bottomNavbarController = Get.put(
      BottomNavbarController(),
    );

    WidgetsBinding.instance.addPostFrameCallback((_) {
      bottomNavbarController.getInitialIndex(index: initialIndex);
    });

    return Scaffold(
      body: Obx(
        () => bottomNavbarController.optionPage.elementAt(
          bottomNavbarController.selectedIndex.value,
        ),
      ),
      bottomNavigationBar: Obx(
        () => Container(
          height: 75,
          decoration: BoxDecoration(
            color: ColorNeutral.neutral50,
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(12),
              topRight: Radius.circular(12),
            ),
            boxShadow: [
              BoxShadow(
                color: ColorCollection.black.withOpacity(0.1),
                offset: const Offset(0, -8),
                blurRadius: 16,
                blurStyle: BlurStyle.normal,
              ),
            ],
          ),
          child: ClipRRect(
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(12),
              topRight: Radius.circular(12),
            ),
            child: NavigationBarTheme(
              data: NavigationBarThemeData(
                labelBehavior: NavigationDestinationLabelBehavior.alwaysShow,
                indicatorColor: ColorPrimary.primary500,
                labelTextStyle: WidgetStateProperty.resolveWith(
                  (states) {
                    if (states.contains(WidgetState.selected)) {
                      return TextStyleCollection.captionBold.copyWith(
                        color: ColorPrimary.primary500,
                        fontSize: 13,
                      );
                    } else {
                      return TextStyleCollection.captionMedium.copyWith(
                        color: ColorNeutral.neutral500,
                        fontSize: 13,
                      );
                    }
                  },
                ),
              ),
              child: NavigationBar(
                backgroundColor: ColorNeutral.neutral50,
                shadowColor: ColorCollection.black.withOpacity(0.2),
                selectedIndex: bottomNavbarController.selectedIndex.value,
                onDestinationSelected: (index) {
                  bottomNavbarController.getPageByIndex(index: index);
                },
                indicatorColor: ColorPrimary.primary500,
                destinations: [
                  NavigationDestination(
                    icon: SvgPicture.asset(
                      IconBottomNavbar.homeBefore,
                      width: 30,
                      height: 30,
                    ),
                    label: 'Home',
                    selectedIcon: SvgPicture.asset(
                      IconBottomNavbar.homeAfter,
                      colorFilter: ColorFilter.mode(
                        ColorNeutral.neutral50,
                        BlendMode.srcIn,
                      ),
                      width: 25,
                      height: 25,
                    ),
                  ),
                  NavigationDestination(
                    icon: SvgPicture.asset(
                      IconBottomNavbar.destinasiBefore,
                      width: 30,
                      height: 30,
                    ),
                    label: 'Destinasi',
                    selectedIcon: SvgPicture.asset(
                      IconBottomNavbar.destinasiAfter,
                      colorFilter: ColorFilter.mode(
                        ColorNeutral.neutral50,
                        BlendMode.srcIn,
                      ),
                      width: 25,
                      height: 25,
                    ),
                  ),
                  NavigationDestination(
                    icon: SvgPicture.asset(
                      IconBottomNavbar.ruteBefore,
                      width: 30,
                      height: 30,
                    ),
                    label: 'Rute',
                    selectedIcon: SvgPicture.asset(
                      IconBottomNavbar.ruteAfter,
                      colorFilter: ColorFilter.mode(
                        ColorNeutral.neutral50,
                        BlendMode.srcIn,
                      ),
                      width: 25,
                      height: 25,
                    ),
                  ),
                  NavigationDestination(
                    icon: SvgPicture.asset(
                      IconBottomNavbar.profilBefore,
                      width: 30,
                      height: 30,
                    ),
                    label: 'Profil',
                    selectedIcon: SvgPicture.asset(
                      IconBottomNavbar.profilAfter,
                      colorFilter: ColorFilter.mode(
                        ColorNeutral.neutral50,
                        BlendMode.srcIn,
                      ),
                      width: 25,
                      height: 25,
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
