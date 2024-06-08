import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tourease/constants/color_constant.dart';
import 'package:tourease/constants/text_style_constant.dart';
import 'package:tourease/controllers/logout_controller.dart';

class ProfilLogoutAlertDialog extends StatelessWidget {
  const ProfilLogoutAlertDialog({super.key});

  @override
  Widget build(BuildContext context) {
    final LogoutController logoutController = Get.put(LogoutController());
    return AlertDialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      insetPadding: const EdgeInsets.symmetric(
        horizontal: 30,
      ),
      actions: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            GestureDetector(
              onTap: () {
                Get.back();
              },
              child: Container(
                width: 128,
                height: 48,
                decoration: BoxDecoration(
                    border: Border.all(color: ColorPrimary.primary700),
                    borderRadius: BorderRadius.circular(12)),
                child: Center(
                  child: Text(
                    'Batal',
                    style: TextStyleCollection.captionMedium.copyWith(
                      fontSize: 14,
                      color: ColorPrimary.primary500,
                    ),
                  ),
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                logoutController.logout();
              },
              child: Container(
                width: 128,
                height: 48,
                decoration: BoxDecoration(
                    color: ColorDanger.danger400,
                    border: Border.all(color: ColorPrimary.primary700),
                    borderRadius: BorderRadius.circular(12)),
                child: Center(
                  child: Text(
                    'Keluar',
                    style: TextStyleCollection.captionMedium.copyWith(
                      fontSize: 14,
                      color: ColorCollection.whitishGray,
                    ),
                  ),
                ),
              ),
            ),
          ],
        )
      ],
      title: Center(
        child: Text('Keluar',
            style: TextStyleCollection.bodyBold
                .copyWith(color: ColorNeutral.neutral900, fontSize: 16)),
      ),
      content: Text(
        'Apakah Anda yakin ingin keluar dari akun ini?',
        style: TextStyleCollection.caption.copyWith(fontSize: 14),
      ),
    );
  }
}
