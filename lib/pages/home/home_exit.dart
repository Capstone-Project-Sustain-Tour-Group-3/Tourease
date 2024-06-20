import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tourease/constants/color_constant.dart';
import 'package:tourease/constants/text_style_constant.dart';
import 'package:tourease/widgets/button_widget.dart';

class HomeExit extends StatelessWidget {
  const HomeExit({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Center(
        child: Text(
          'Keluar',
          style: TextStyleCollection.bodyBold.copyWith(
            color: ColorNeutral.neutral900,
            fontSize: 16,
          ),
        ),
      ),
      content: Text(
        'Apakah Anda yakin ingin keluar dari aplikasi?',
        style: TextStyleCollection.caption.copyWith(
          fontSize: 14,
          color: ColorNeutral.neutral700,
        ),
      ),
      actions: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: SizedBox(
                height: 50,
                width: double.infinity,
                child: ButtonWidget(
                  onPressed: () {
                    Get.back();
                  },
                  backgroundColor: ColorNeutral.neutral50,
                  side: BorderSide(
                    color: ColorPrimary.primary500,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.close,
                        color: ColorPrimary.primary500,
                      ),
                      const SizedBox(width: 5),
                      Text(
                        'Batal',
                        style: TextStyleCollection.captionBold.copyWith(
                          color: ColorPrimary.primary500,
                          fontSize: 14,
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(
              width: 15,
            ),
            Expanded(
              child: SizedBox(
                height: 50,
                width: double.infinity,
                child: ButtonWidget(
                  onPressed: () {
                    exit(0);
                  },
                  backgroundColor: ColorDanger.danger500,
                  child: Row(
                    children: [
                      Icon(
                        Icons.logout,
                        color: ColorNeutral.neutral50,
                      ),
                      const SizedBox(width: 5),
                      Text(
                        'Keluar',
                        style: TextStyleCollection.captionBold.copyWith(
                          color: ColorNeutral.neutral50,
                          fontSize: 14,
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
