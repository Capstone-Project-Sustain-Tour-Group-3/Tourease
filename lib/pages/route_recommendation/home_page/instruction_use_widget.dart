import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:tourease/constants/color_constant.dart';
import 'package:tourease/constants/text_style_constant.dart';

class InstructionUseWidget extends StatelessWidget {
  final String number;
  final String text;

  const InstructionUseWidget({
    super.key,
    required this.number,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AutoSizeText(
            number,
            style: TextStyleCollection.caption
                .copyWith(height: 1.5, color: ColorNeutral.neutral900),
            minFontSize: 14,
            maxFontSize: 16,
          ),
          const SizedBox(width: 4),
          Expanded(
            child: AutoSizeText(
              text,
              style: TextStyleCollection.caption
                  .copyWith(height: 1.5, color: ColorNeutral.neutral900),
              minFontSize: 14,
              maxFontSize: 16,
            ),
          ),
        ],
      ),
    );
  }
}
