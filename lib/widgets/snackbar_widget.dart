import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tourease/constants/color_constant.dart';
import 'package:tourease/constants/text_style_constant.dart';

class SnackbarWidget {
  static void showSnackbar({
    required String message,
    Color? backgroundColor,
    Color? textContainerColor,
    Color? textColor,
  }) {
    Get.snackbar(
      '',
      '',
      backgroundColor: backgroundColor ?? ColorDanger.danger100,
      titleText: Container(),
      borderRadius: 4,
      boxShadows: [
        BoxShadow(
          color: const Color(0xFF000000).withOpacity(0.1),
          blurRadius: 16,
          offset: const Offset(0, 8),
        ),
      ],
      messageText: Center(
        child: Container(
          color: textContainerColor ?? ColorDanger.danger100,
          child: Text(
            message,
            style: TextStyleCollection.caption.copyWith(
              fontSize: 14,
              color: textColor ?? ColorDanger.danger500,
            ),
          ),
        ),
      ),
      margin: const EdgeInsets.only(left: 16, right: 16, top: 24),
      duration: const Duration(seconds: 4),
    );
  }
}
