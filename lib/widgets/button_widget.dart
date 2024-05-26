import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:tourease/constants/color_constant.dart';
import 'package:tourease/constants/text_style_constant.dart';

class ButtonWidget extends StatelessWidget {
  const ButtonWidget({
    super.key,
    required this.onPressed,
    this.side,
    required this.text,
    required this.textColor,
    this.backgroundColor,
  });

  final void Function()? onPressed;
  final BorderSide? side;
  final String text;
  final Color textColor;
  final Color? backgroundColor;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
          side: side ?? BorderSide.none,
        ),
        backgroundColor: backgroundColor ?? ColorPrimary.primary500,
        overlayColor: ColorNeutral.neutral200,
        shadowColor: ColorCollection.transparent,
      ),
      child: AutoSizeText(
        text,
        style: TextStyleCollection.bodyMedium.copyWith(
          color: textColor,
        ),
        minFontSize: 14,
        maxFontSize: 16,
      ),
    );
  }
}
