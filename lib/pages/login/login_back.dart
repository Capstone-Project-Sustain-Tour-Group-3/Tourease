import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tourease/constants/color_constant.dart';
import 'package:tourease/controllers/logout_controller.dart';

class LoginBack extends StatelessWidget {
  const LoginBack({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 40),
        Obx(() {
          final bool showIconButton =
              Get.put(LogoutController()).showIconButton.value;
          if (showIconButton) {
            return Padding(
              padding: const EdgeInsets.only(left: 8),
              child: IconButton(
                onPressed: () {
                  Get.back();
                },
                style: ButtonStyle(
                  overlayColor: WidgetStatePropertyAll(ColorNeutral.neutral100),
                ),
                icon: Icon(
                  Icons.arrow_back,
                  color: ColorPrimary.primary500,
                ),
              ),
            );
          } else {
            return const SizedBox.shrink();
          }
        }),
      ],
    );
  }
}