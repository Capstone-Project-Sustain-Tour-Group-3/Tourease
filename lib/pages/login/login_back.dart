import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tourease/constants/color_constant.dart';

class LoginBack extends StatelessWidget {
  final bool showIconButton;

  const LoginBack({super.key, this.showIconButton = true});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 40),
        if (showIconButton)
          Padding(
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
          ),
      ],
    );
  }
}
