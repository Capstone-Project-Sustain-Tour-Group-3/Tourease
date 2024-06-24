import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tourease/constants/color_constant.dart';

class RegisterBack extends StatelessWidget {
  final bool addSpace;

  const RegisterBack({super.key, this.addSpace = true});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (addSpace) const SizedBox(height: 40), 
        Padding(
          padding: const EdgeInsets.only(left: 8),
          child: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: Icon(
              Icons.arrow_back,
              color: ColorPrimary.primary500,
            ),
            style: ButtonStyle(
              overlayColor: WidgetStateProperty.all(ColorNeutral.neutral100),
            ),
          ),
        ),
      ],
    );
  }
}
